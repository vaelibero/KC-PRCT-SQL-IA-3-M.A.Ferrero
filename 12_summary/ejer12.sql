with ivr_summary as (
  select cal.ivr_id as ivr_id, 
    cal.phone_number as numero_llamante, 
    cal.ivr_result as ivr_result, 
    --cal.vdn_label as calls_vdn_label,
    -- vdn aggregation
    case when cal.vdn_label = "ABSORPTION" then "ABSORPTION"
    when cal.vdn_label = 'ATC%' then "FRONT"
    when cal.vdn_label = 'TECH%' then "TECH"
    else 'RESTO'
    end as vdn_aggregation,
    ---
    cal.start_date as start_date, 
    FORMAT_DATE('%Y%m%d',cal.start_date ) as calls_start_date_id, 
    cal.end_date as end_date, 
    FORMAT_DATE('%Y%m%d',cal.end_date ) as calls_end_date_id, 
    cal.total_duration as total_duration, 
    cal.customer_segment as customer_segment, 
    cal.ivr_language as ivr_language, 
    cal.steps_module as steps_module, 
    cal.module_aggregation as module_aggregation, 
    --mod.module_sequece, 
    --mod.module_name, 
    -- flag AVERIA_MASIVA
    case when mod.module_name = "AVERIA_MASIVA" then 1
    else 0
    end as masiva_lg,
    --
    --mod.module_duration, 
    --mod.module_result, 
    --ste.step_sequence, 
    --ste.step_name,
    ste.step_result as step_result,
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
    -- ste.step_description_error, 
    ste.document_type as document_type,  
    ste.document_identification as document_identification, 
    ste.customer_phone as customer_phone, 
    ste.billing_account_id
    from keepcoding.ivr_calls cal 
    left join  keepcoding.ivr_modules mod
    on mod.ivr_id = cal.ivr_id
    left join keepcoding.ivr_steps ste
    on mod.ivr_id = ste.ivr_id
    )
select distinct(ivr_id)
    , numero_llamante
    , ivr_result
    , step_result
    , vdn_aggregation
    , start_date
    , end_date
    , total_duration
    , customer_segment
    , ivr_language
    , steps_module
    , module_aggregation
    , document_type
    , document_identification
    , customer_phone
    , billing_account_id
    , masiva_lg
    , info_by_phone_lg
    , info_by_dni_lg
    --, repeated_phone_24H
    --, cause_recall_phone_24H
   from ivr_summary order by ivr_id;
