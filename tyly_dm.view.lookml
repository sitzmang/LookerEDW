- view: tyly_dm
  sql_table_name: RPT.MAIN.TYLY_DM
  fields:

  - dimension: tyly_cd
    label: 'TYLY Cd'
    type: string
    sql: ${TABLE}.TYLY_CD

  - dimension: tyly_sid
    type: string
    sql: ${TABLE}.TYLY_SID
    hidden: true

