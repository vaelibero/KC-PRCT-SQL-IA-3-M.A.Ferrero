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
    mod.module_duration, 
    mod.module_result, 
    ste.step_sequence, 
    ste.step_name, 
    ste.step_result, 
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
    )
    ,customer_identification as(
        select
            ste.ivr_id,
            ste.document_type as gen_document_type, 
            ste.document_identification as gen_document_identification,
            ste.billing_account_id as gen_billing_account_id
        from `keepcoding-450409.keepcoding.ivr_steps` ste
        
      )
--select * from ivr_details order by calls_ivr_id;
select 
    distinct(det.calls_ivr_id), 
    -- det.document_type,
    -- det.document_identification,
    cusid.gen_billing_account_id
    -- cusid.gen_document_identification,
    -- cusid.gen_document_type
from ivr_details det
right join customer_identification cusid
on cusid.ivr_id = det.calls_ivr_id
where 
  
  --cusid.gen_document_type NOT IN ('UNKNOWN')
  --or 
  --cusid.gen_document_identification  NOT IN ('UNKNOWN')
  --or 
  cusid.gen_billing_account_id  NOT IN ('UNKNOWN')

order by calls_ivr_id ASC;