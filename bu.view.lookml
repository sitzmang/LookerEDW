- view: bu
  sql_table_name: MAIN.BU
  fields:

  - dimension: bu_id
    primary_key: true
    type: string
    sql: ${TABLE}.BU_ID

  - dimension: bu_name
    type: string
    sql: ${TABLE}.BU_NAME

  - measure: count
    type: count
    drill_fields: [bu_id, bu_name, email.count, jobs.count]

