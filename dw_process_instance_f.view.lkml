view: dw_process_instance_f {
  sql_table_name: edw.edw.dw_process_instance_f ;;
  #-- fk

  dimension: process_instance_sid {
    type: number
    sql: ${TABLE}.process_instance_sid ;;
  }

  dimension: process_sid {
    type: number
    sql: ${TABLE}.process_sid ;;
  }

  dimension: parent_process_sid {
    type: number
    sql: ${TABLE}.parent_process_sid ;;
  }

  dimension: process_start_dt {
    type: date
    sql: ${TABLE}.process_start_dt ;;
  }

  dimension: process_end_dt {
    type: date
    sql: ${TABLE}.process_end_dt ;;
  }

  dimension: last_ctrl_dt {
    type: date
    sql: ${TABLE}.last_ctrl_dt ;;
  }

  dimension: restage_minutes {
    type: number
    sql: ${TABLE}.restage_minutes ;;
  }

  dimension: rows_read_cnt {
    type: number
    sql: ${TABLE}.rows_read_cnt ;;
  }

  dimension: status_cd {
    type: string
    sql: ${TABLE}.status_cd ;;
  }

  dimension: status_dscr {
    type: string
    sql: ${TABLE}.status_dscr ;;
  }

  dimension: rows_insert_cnt {
    type: number
    sql: ${TABLE}.rows_insert_cnt ;;
  }

  dimension: rows_update_cnt {
    type: number
    sql: ${TABLE}.rows_update_cnt ;;
  }

  dimension: rows_delete_cnt {
    type: number
    sql: ${TABLE}.rows_delete_cnt ;;
  }

  dimension: dw_current_fl {
    type: string
    sql: ${TABLE}.dw_current_fl ;;
  }
}
