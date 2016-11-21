view: location_dm {
  sql_table_name: RPT.MAIN.STATE_DM ;;
  #-- pk

  dimension: state_cd_shk {
    type: string
    sql: ${TABLE}.STATE_CD_SHK ;;
    hidden: yes
  }

  #-- dimensions

  dimension: country_cd {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.COUNTRY_CD ;;
  }

  dimension: country_name {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.COUNTRY_NAME ;;
  }

  dimension: iso_state_cd {
    type: string
    sql: ${TABLE}.ISO_STATE_CD ;;
    hidden: yes
  }

  dimension: latitude {
    type: string
    sql: ${TABLE}.LATITUDE ;;
    hidden: yes
  }

  dimension: longitude {
    type: string
    sql: ${TABLE}.LONGITUDE ;;
    hidden: yes
  }

  dimension: state_cd {
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.STATE_CD ;;
  }

  dimension: state_location {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  dimension: state_name {
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.STATE_NAME ;;
  }
}
