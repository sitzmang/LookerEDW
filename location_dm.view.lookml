- view: location_dm
  sql_table_name: RPT.MAIN.STATE_DM
  fields:


#-- pk

  - dimension: state_cd_shk
    type: string
    sql: ${TABLE}.STATE_CD_SHK
    hidden: true

#-- dimensions

  - dimension: country_cd
    type: string
    map_layer: countries
    sql: ${TABLE}.COUNTRY_CD

  - dimension: country_name
    type: string
    map_layer: countries
    sql: ${TABLE}.COUNTRY_NAME

  - dimension: iso_state_cd
    type: string
    sql: ${TABLE}.ISO_STATE_CD
    hidden: true

  - dimension: latitude
    type: string
    sql: ${TABLE}.LATITUDE
    hidden: true

  - dimension: longitude
    type: string
    sql: ${TABLE}.LONGITUDE
    hidden: true

  - dimension: state_cd
    type: string
    map_layer: us_states
    sql: ${TABLE}.STATE_CD

  - dimension: state_location
    type: location
    sql_latitude:  ${latitude}
    sql_longitude: ${longitude}

  - dimension: state_name
    type: string
    map_layer: us_states
    sql: ${TABLE}.STATE_NAME
