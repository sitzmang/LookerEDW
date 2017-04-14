view: dw_process_dm {
  sql_table_name: edw.edw.dw_process_dm ;;
  #-- fk

measure: process_cnt {
  type: count_distinct
  sql:${TABLE}.process_name ;;
}

  dimension: process_sid {
    type: number
    sql: ${TABLE}.process_sid ;;
  }

  dimension: process_type_code {
    type: string
    sql: ${TABLE}.process_type_code ;;
  }

  dimension: process_name {
    type: string
    sql: ${TABLE}.process_name ;;
  }

  dimension: last_ctrl_dt {
    type: date
    sql: ${TABLE}.last_ctrl_dt ;;
  }

  dimension: restage_minutes {
    type: number
    sql: ${TABLE}.restage_minutes ;;
  }

}
