with ivr_details as (
  select calls_ivr_id, 
    calls_phone_number as calls_phone_number, 
    calls_ivr_result as calls_ivr_result, 
    calls_vdn_label as calls_vdn_label,

    from keepcoding-450409.keepcoding.ivr_details
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
    )
--select * from ivr_details order by calls_ivr_id;
select distinct(calls_ivr_id) as dis_ivr_id
  , vdn_aggregation 
  from vdn_agg order by calls_ivr_id;
