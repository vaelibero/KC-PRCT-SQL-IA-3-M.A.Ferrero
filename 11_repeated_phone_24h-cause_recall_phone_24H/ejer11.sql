  with tablecomp as(
  select calls_ivr_id
  , calls_start_date
  , calls_phone_number
  , lag(calls_start_date)
    over (partition by cast(calls_ivr_id as string) 
    order by calls_start_date asc) as REPEATED_PHONE_24h
  , lead(calls_end_date)
    over (partition by cast(calls_ivr_id as string) 
    order by calls_start_date desc) as CAUSE_RECALL_PHONE_24H
  from `keepcoding-450409.keepcoding.ivr_details` det
  ),
  tablewon as (
    select calls_ivr_id
    , calls_start_date
    , calls_phone_number
    , REPEATED_PHONE_24h
    , CAUSE_RECALL_PHONE_24H
    from tablecomp
    where
    REPEATED_PHONE_24h is not null and
    CAUSE_RECALL_PHONE_24H is not null
  )
  select * from tablewon