- view: em_attribution_type_dm
  sql_table_name: rpt.main.em_attribution_type_dm
  fields:

#-- fk

  - dimension: em_attribution_type_sid
    type: number
    sql: ${TABLE}.em_attribution_type_sid
    hidden: true

#-- dimensions

  - dimension: attribution_type_cd
    type: string
    sql: ${TABLE}.attribution_type_cd
    hidden: true
    
  - dimension: attribution_type_name
    label: 'Name'
    type: string
    sql: ${TABLE}.attribution_type_name

