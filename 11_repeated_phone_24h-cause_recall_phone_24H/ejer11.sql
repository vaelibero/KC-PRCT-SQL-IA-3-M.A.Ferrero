with ivr_details as (
  select cal.ivr_id as calls_ivr_id, 
    cal.phone_number as calls_phone_number,
    cal.ivr_result as calls_ivr_result, 
    cal.vdn_label as calls_vdn_label,
    -- vdn aggregation
    case when cal.vdn_label = "ABSORPTION" then "ABSORPTION"
    when cal.vdn_label = 'ATC%' then "FRONT"
    when cal.vdn_label = 'TECH%' then "TECH"
    else 'RESTO'
    end as vdn_aggregation,
    ---
    cal.start_date as calls_start_date, 
    FORMAT_DATE('%Y%m%d',cal.start_date ) as calls_start_date_id, 
    cal.end_date as calls_end_date, 
    FORMAT_DATE('%Y%m%d',cal.end_date ) as calls_end_date_id, 
    cal.total_duration as calls_total_duration, 
    cal.customer_segment as calls_customer_segment, 
    cal.ivr_language as calls_ivr_language, 
    cal.steps_module as calls_steps_module, 
    cal.module_aggregation as calls_module_aggregation, 
    mod.module_sequece, 
    mod.module_name, 
    -- flag AVERIA_MASIVA
    case when mod.module_name = "AVERIA_MASIVA" then 1
    else 0
    end as AVERIA_MASIVA,
    --
    mod.module_duration, 
    mod.module_result, 
    ste.step_sequence, 
    ste.step_name,
    ste.step_result,
    -- flag  info_by_dni_lg
    case when ste.step_name = "CUSTOMERINFOBYDNI.TX" AND ste.step_result IN ('OK') then 1
    else 0
    end as info_by_dni_lg,
    -- 
    -- flag info_by_phone_lg
    case when ste.step_result = "OK" then 1
    else 0
    end as info_by_phone_lg,
    --
    ste.step_description_error, 
    ste.document_type, 
    ste.document_identification, 
    ste.customer_phone, 
    ste.billing_account_id
    from keepcoding.ivr_calls cal 
    left join  keepcoding.ivr_modules mod
    on mod.ivr_id = cal.ivr_id
    left join keepcoding.ivr_steps ste
    on mod.ivr_id = ste.ivr_id
    ), dist_calls as (
      select distinct(calls_ivr_id)
      , calls_phone_number as dist_phone
      , calls_start_date as dist_start_date
      , calls_end_date as dist_end_date
      -- lag REPEATED_PHONE_24h (BQ no me acepta varchar(75) asi que pongo string)
      --, lag(calls_phone_number) 
      --over (partition by cast(calls_ivr_id as string) 
      --order by calls_start_date ASC) as REPEATED_PHONE_24h
      --
      -- lag RECALL_PHONE_24h (BQ no me acepta varchar(75) asi que pongo string)
      --, lag(calls_phone_number) 
      --over (partition by cast(calls_ivr_id as string) 
      --order by calls_start_date DESC) as RECALL_PHONE_24h,
      --
      from ivr_details
      order by calls_phone_number asc
      , dist_start_date asc
--------
    ), dist_calls_reg_cte as (
      select dist_calls as dist_calls_reg_cte_id
      , dist_phone as dist_phone_reg
      , dist_start_date as dist_start_date_reg
      , dist_end_date as dist_end_date_reg
      , lag(dist_start_date)
        over (partition by cast(dist_phone as string) 
        order by dist_start_date asc) as REPEATED_PHONE_24h
      , lead(dist_start_date)
        over (partition by cast(dist_phone as string) 
        order by dist_start_date asc) as CAUSE_RECALL_PHONE_24H
      from dist_calls 
      order by dist_calls.dist_phone asc, dist_calls.dist_start_date
  --------
    ), calls_reg as(      
    select 
    dist_calls_reg_cte_id as dist_calls_reg_1
    , dist_phone_reg as dist_phone_reg_1
    --, dist_phone
    , dist_start_date_reg as dist_start_date_reg_1
    , REPEATED_PHONE_24h
    , CAUSE_RECALL_PHONE_24H
    --, dist_end_date
    -- Pruebo con comando timestamp_diff
    , timestamp_diff(dist_start_date_reg, REPEATED_PHONE_24h, hour) as diff_bef_24h
    , timestamp_diff(CAUSE_RECALL_PHONE_24H, dist_start_date_reg, hour) as diff_post_24h
    from dist_calls_reg_cte)
--------
    select dist_calls_reg_1
    --, dist_phone_reg_1
    --, REPEATED_PHONE_24h
    --, CAUSE_RECALL_PHONE_24H
    , diff_bef_24h
    -- flag bef 24 llamada anterior menor de 24 horas
    , case when diff_bef_24h <=24 then 1 else 0 end as flag_repeat
    , diff_post_24h

    -- flag post 24 llamada posterior menor de 24 horas
    , case when diff_post_24h <=24 then 1 else 0 end as flag_recall
    from calls_reg
