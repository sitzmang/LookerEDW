- view: system_dm
  sql_table_name: MAIN.SYSTEM_DM
  fields:

#-- pk

  - dimension: system_sid
    type: string
    sql: ${TABLE}.SYSTEM_SID
    hidden: true

#-- pk

  - dimension: system_cd
    type: string
    sql: ${TABLE}.SYSTEM_CD
    hidden: true

  - dimension: system_name
    type: string
    sql: ${TABLE}.SYSTEM_NAME
