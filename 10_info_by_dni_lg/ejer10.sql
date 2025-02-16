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
    )
select 
  distinct(calls_ivr_id)
  , info_by_dni_lg
  , step_name
  , step_result
from info_dni
order by calls_ivr_id ASC;
