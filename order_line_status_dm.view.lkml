view: order_line_status_dm {
  sql_table_name: RPT.MAIN.ORDER_LINE_STATUS_DM ;;
  #-- pk

  dimension: order_line_status_shk {
    type: string
    sql: ${TABLE}.ORDER_LINE_STATUS_SHK ;;
    hidden: yes
  }

  #-- dimensions

  dimension: master_line_status_cd {
    label: "Master Line Status Cd"
    type: string
    sql: ${TABLE}.MASTER_LINE_STATUS_CD ;;
    hidden: yes
  }

  dimension: master_line_status_name {
    label: "Master Line Status Name"
    type: string
    sql: ${TABLE}.MASTER_LINE_STATUS_NAME ;;
  }

  dimension: order_line_status_cd {
    label: "Order Line Status Cd"
    type: string
    sql: ${TABLE}.ORDER_LINE_STATUS_CD ;;
    hidden: yes
  }

  dimension: order_line_status_name {
    label: "Order Line Status Name"
    type: string
    sql: ${TABLE}.ORDER_LINE_STATUS_NAME ;;
  }

  dimension: order_line_status_prefix {
    type: string
    sql: ${TABLE}.ORDER_LINE_STATUS_PREFIX ;;
    hidden: yes
  }
}
