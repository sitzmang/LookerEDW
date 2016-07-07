- view: billing_state_dm
  sql_table_name: MAIN.STATE_DM
  fields:


#-- pk

  - dimension: state_cd_shk
    type: string
    sql: ${TABLE}.STATE_CD_SHK
    hidden: true

#-- dimensions

  - dimension: country_cd
    type: string
    sql: ${TABLE}.COUNTRY_CD

  - dimension: country_name
    type: string
    sql: ${TABLE}.COUNTRY_NAME

  - dimension: iso_state_cd
    type: string
    sql: ${TABLE}.ISO_STATE_CD
    hidden: true

  - dimension: state_cd
    type: string
    sql: ${TABLE}.STATE_CD

  - dimension: state_name
    type: string
    sql: ${TABLE}.STATE_NAME
