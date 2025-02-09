-- Variante para pgsql en entornos pgadmin 
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
    -- Comando para crear la tabla en pgadmin, en bigquery tendríamos que crear la tabla y luego selecto into
    select into keepcoding.ivr_details from ivr_details;
    select * from ivr_details order by calls_ivr_id;

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
select * from ivr_details order by calls_ivr_id;
