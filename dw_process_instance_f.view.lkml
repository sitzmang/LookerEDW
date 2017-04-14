view: dw_process_instance_f {
  sql_table_name: edw.edw.dw_process_instance_f ;;
  #-- fk

  measure: rows_read_cnt {
    type: sum
    sql: ${TABLE}.rows_read_cnt ;;
    label: "Rows read"
    view_label: "1) Measures"
    description: "Sum of process rows read"
  }

  measure: rows_insert_cnt {
    type: sum
    sql: ${TABLE}.rows_insert_cnt ;;
    label: "Rows inserted"
    view_label: "1) Measures"
    description: "Sum of process rows inserted"
  }

  measure: rows_update_cnt {
    type: sum
    sql: ${TABLE}.rows_update_cnt ;;
    label: "Rows updated"
    view_label: "1) Measures"
    description: "Sum of process rows updated"
  }

  measure: rows_delete_cnt {
    type: sum
    sql: ${TABLE}.rows_delete_cnt ;;
    label: "Rows deleted"
    view_label: "1) Measures"
    description: "Sum of process rows deleted"
  }

  dimension: process_instance_sid {
    type: number
    sql: ${TABLE}.process_instance_sid ;;
  }

  dimension: process_sid {
    type: number
    sql: ${TABLE}.process_sid ;;
    hidden: yes
  }

  dimension: parent_process_sid {
    type: number
    sql: ${TABLE}.parent_process_sid ;;
  }

  dimension: process_start_dt {
    type: date_time
    sql: ${TABLE}.process_start_dt ;;
    hidden: yes
  }

  dimension: process_end_dt {
    type: date_time
    sql: ${TABLE}.process_end_dt ;;
    hidden: yes
  }

  dimension: last_ctrl_dt {
    type: date
    sql: ${TABLE}.last_ctrl_dt ;;
  }

  dimension: restage_minutes {
    type: number
    sql: ${TABLE}.restage_minutes ;;
  }

  dimension: status_cd {
    type: string
    sql: ${TABLE}.status_cd ;;
  }

  dimension: status_dscr {
    type: string
    sql: ${TABLE}.status_dscr ;;
  }

  dimension: dw_current_fl {
    type: string
    sql: ${TABLE}.dw_current_fl ;;
  }

  dimension: execution_time {
    type: number
    sql: datediff(seconds, ${TABLE}.process_start_dt, ${TABLE}.process_end_dt);;
    label: "Execution Time"
    view_label: "1) Measures"
    description: "Process start date - process end date (seconds)"

  }

}
