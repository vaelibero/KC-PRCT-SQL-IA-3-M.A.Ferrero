  with ivr_details as (
    select calls_ivr_id, 
      calls_phone_number as calls_phone_number, 
      calls_ivr_result as calls_ivr_result, 
      calls_vdn_label as calls_vdn_label,

      from keepcoding-450409.keepcoding.ivr_details
      --------------------------------------
      ), vdn_agg as (
        select 
          calls_ivr_id,
          -- vdn aggregation
          case when calls_vdn_label = "ABSORPTION" then "ABSORPTION"
          when calls_vdn_label like 'ATC%' then "FRONT"
          when calls_vdn_label like 'TECH%' then "TECH"
          else 'RESTO'
          end as vdn_aggregation
        from ivr_details
      --------------------------------------
      ), customer_identification as(
        select
          ste.ivr_id,
          ste.document_type as gen_document_type, 
          ste.document_identification as gen_document_identification,
          ste.billing_account_id as gen_billing_account_id,
          ste.customer_phone as gen_customer_phone
        from `keepcoding-450409.keepcoding.ivr_steps` ste
      --------------------------------------
      ), masive as (
        select 
          calls_ivr_id
          , module_name
          , case when module_name = "AVERIA_MASIVA" then 1
          else 0
          end as masiva_lg
        from `keepcoding.ivr_details`
      --------------------------------------
      ), info_phone as(
        select 
          calls_ivr_id
          , step_result
          , case when step_result = "OK" then 1
          else 0
          end as info_by_phone_lg
        from `keepcoding.ivr_details`
      --------------------------------------
      ), info_dni as(
        select 
          calls_ivr_id
          , step_name
          , step_result
          , case when step_name = "CUSTOMERINFOBYDNI.TX" AND step_result IN ('OK') then 1
          else 0
          end as info_by_dni_lg
        from `keepcoding.ivr_details`    
      --------------------------------------
      ), dist_calls_reg as (
        -- Esto nos muestra las distintas llamadas.
        select 
          distinct(calls_ivr_id)
          , calls_phone_number
          , calls_start_date
          
        from `keepcoding.ivr_details` 
        order by calls_phone_number asc, calls_start_date asc
      --------------------------------------
      ), flags_calls as (
        -- Esto nos muestra las flags de llamada previa y llamada posterior.
        select 
          calls_ivr_id
          , calls_phone_number
          , calls_start_date
          , lag(calls_start_date)
          over (partition by cast(calls_phone_number as string) 
          order by calls_start_date asc) as REPEATED_PHONE_24h
        , lead(calls_start_date)
          over (partition by cast(calls_phone_number as string) 
          order by calls_start_date asc) as CAUSE_RECALL_PHONE_24H
        from dist_calls_reg
      --------------------------------------
      ), diff_time_calls as (
      -- Trato de calcular el tiempo entre llamadas
        select 
          calls_ivr_id
          , calls_phone_number
          , REPEATED_PHONE_24h
          , calls_start_date
          , CAUSE_RECALL_PHONE_24H
          , timestamp_diff(calls_start_date, REPEATED_PHONE_24h, hour) as diff_bef_24h
          , timestamp_diff(CAUSE_RECALL_PHONE_24H, calls_start_date, hour) as diff_post_24h
        from flags_calls
        where 
          REPEATED_PHONE_24h is not null and
          CAUSE_RECALL_PHONE_24H is not null
        order by calls_phone_number asc, flags_calls.calls_start_date asc
      --------------------------------------
      ) , flag_time_24 as (
      -- Aqui pongo el flag para poder ver cuales llamadas anteriores o posteriores tienen un plazo menor a 24 horas.
        select 
          calls_ivr_id
          , calls_phone_number
          , REPEATED_PHONE_24h
          , calls_start_date
          , CAUSE_RECALL_PHONE_24H
          , diff_bef_24h
          , case when diff_bef_24h <=24 then 1 else 0 end as flag_repeat
          , diff_post_24h
          , case when diff_post_24h <=24 then 1 else 0 end as flag_recall
        from diff_time_calls
        where diff_time_calls.diff_bef_24h !=0 and
        diff_time_calls.diff_post_24h !=0
        order by calls_phone_number
      --------------------------------------
      ), const_ivr_summarize as (
      -- Voy a tratar de unificar todas con el comando unnion
      select distinct(calls_ivr_id) as ivr_id
      , calls_phone_number as ivr_id
      , calls_ivr_result as ivr_result
      , calls_start_date as start_date
      , calls_end_date as end_date
      , calls_total_duration as total_duration
      , calls_ivr_language as ivr_language
      , calls_steps_module as steps_module
      , calls_module_aggregation as module_aggregation
      from `keepcoding-450409.keepcoding.ivr_details`
      union all
        -- Datos del cte vdn_agg
        select vdn_agg.vdn_aggregation
        from vdn_agg
      union all
        -- Datos del cte de document_identification
        select customer_identification.gen_document_type as document_type
        , customer_identification.gen_document_identification as document_identification
        , customer_identification.gen_customer_phone as customer_phone
        , customer_identification.gen_billing_account_id
        from customer_identification
      union all
        -- Datos del cte masive
        select masive.masiva_lg
        from masive 
      union all
        -- Datos del cte info_phone
        select info_phone.info_by_phone_lg
        from info_phone
      union all
        -- Datos del cte info_dni
        select info_dni.info_by_dni_lg
        from info_dni
      union all
        -- Datos de Flag_time_24
        select REPEATED_PHONE_24h
        , CAUSE_RECALL_PHONE_24H
        from flag_time_24
      )
    select *
    from const_ivr_summarize 
    order by calls_ivr_id


      
  ;
