- view: em_list_dm
  sql_table_name: rpt.main.em_list_dm
  fields:

#-- fk

  - dimension: em_list_shk
    type: number
    sql: ${TABLE}.em_list_shk
    hidden: true

  - dimension: src_client_id
    type: number
    sql: ${TABLE}.src_client_id
    hidden: true

  - dimension: src_list_id
    type: number
    sql: ${TABLE}.src_list_id
    hidden: true

#-- dimensions

  - dimension: list_name
    label: 'List Name'
    type: string
    sql: ${TABLE}.list_name
    
  - dimension: list_description
    label: 'List Description'
    type: string
    sql: ${TABLE}.list_dscr
    
  - dimension: list_status
    label: 'List Status'
    type: string
    sql: ${TABLE}.list_status
    
  - dimension: list_type
    label: 'List Type'
    type: string
    sql: ${TABLE}.list_type
    
  - dimension: created_dt
    label: 'Created Date'
    type: date_date
    sql: ${TABLE}.created_dt
    
