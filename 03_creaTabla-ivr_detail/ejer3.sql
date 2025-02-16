-- Consulta en bigquery, se salva en csv y se sube el fichero como tabla ivr_details
with ivr_details as (
  select cal.ivr_id as calls_ivr_id, 
    cal.phone_number as calls_phone_number, 
    cal.ivr_result as calls_ivr_result, 
    cal.vdn_label as calls_vdn_label, 
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
    cast(ste.step_description_error as string) as step_description_error, 
    cast(ste.document_type as string) as document_type,
    -- Para que no de errores de importación a la hora de crear la tabla luego trato ed pasar todo a int y ponerle valor 0 si acaso en document_identification, 
    case 
      when lower(ste.document_identification) = 'unknown' then 0
      when safe_cast(ste.document_identification as int64) is not null then cast(ste.document_identification as int64)
      else 0
    end as document_identification,
    -- Para que no de errores de importación a la hora de crear la tabla luego trato ed pasar todo a int y ponerle valor 0 si acaso en customer_phone.
    case 
      when lower(ste.customer_phone) = 'unknown' then 0
      when safe_cast(ste.customer_phone as int64) is not null then cast(ste.customer_phone as int64)
      else 0
    end as customer_phone,
    -- Para que no de errores de importación a la hora de crear la tabla luego trato ed pasar todo a int y ponerle valor 0 si acaso en billing_account_id.
    case 
      when lower(ste.billing_account_id) = 'unknown' then 0
      when safe_cast(ste.billing_account_id as int64) is not null then cast(ste.billing_account_id as int64)
      else 0
    end as billing_account_id
    from keepcoding.ivr_calls cal 
    left join  keepcoding.ivr_modules mod
    on mod.ivr_id = cal.ivr_id
    left join keepcoding.ivr_steps ste
    on mod.ivr_id = ste.ivr_id and mod.module_sequece = ste.module_sequece
    )
select * from ivr_details order by calls_ivr_id;
