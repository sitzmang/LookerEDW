- view: et_lists
  sql_table_name: exacttarget.main.et_lists
  fields:

#-- fk

  - dimension: client_id
    type: number
    sql: ${TABLE}.client_id
    hidden: true

  - dimension: list_id
    type: number
    sql: ${TABLE}.list_id
    hidden: true

#-- dimensions

  - dimension: list_name
    label: 'List Name'
    type: string
    sql: ${TABLE}.list_name
    
  - dimension: list_description
    label: 'List Description'
    type: string
    sql: ${TABLE}.description
    
  - dimension: status
    label: 'List Status'
    type: string
    sql: ${TABLE}.status
    
  - dimension: list_type
    label: 'List Type'
    type: string
    sql: ${TABLE}.list_type
    
  - dimension: date_created
    label: 'Created Date'
    type: date_date
    sql: ${TABLE}.date_created
    
