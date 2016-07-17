- view: et_business_unit_lkp
  sql_table_name: exacttarget.main.et_business_unit_lkp
  fields:

#-- fk

  - dimension: client_id
    type: number
    sql: ${TABLE}.client_id
    hidden: true

#-- dimensions

  - dimension: business_unit_name
    label: 'BU Name'
    type: string
    sql: ${TABLE}.business_unit_name
