- view: et_business_unit_lkp
  sql_table_name: exacttarget.main.et_business_unit_lkp
  fields:

#-- fk

  - dimension: client_id
    label: 'Client ID'
    type: number
    sql: ${TABLE}.client_id
    hidden: false

#-- dimensions

  - dimension: business_unit_name
    label: 'BU Name'
    type: string
    sql: ${TABLE}.business_unit_name
    drill_fields: [et_send_jobs.email_type,et_subscribers.email_domain]
