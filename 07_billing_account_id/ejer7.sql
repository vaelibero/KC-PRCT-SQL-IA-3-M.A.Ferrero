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
    ---
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
    )
select 
    distinct(det.calls_ivr_id)
    , cusid.gen_customer_phone
    , gen_document_identification
from ivr_details det
right join customer_identification cusid
on cusid.ivr_id = det.calls_ivr_id
where 
  cusid.gen_customer_phone NOT IN ('UNKNOWN')

order by calls_ivr_id ASC;
