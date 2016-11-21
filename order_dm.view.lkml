view: order_dm {
  sql_table_name: RPT.MAIN.ORDER_DM ;;
  #-- pk

  dimension: order_shk {
    type: string
    sql: ${TABLE}.ORDER_SHK ;;
    hidden: yes
  }

  #-- dimensions

  dimension: web_order_no {
    label: "Web Order No"
    type: string
    sql: ${TABLE}.WEB_ORDER_NO ;;
  }

  dimension: order_prefix {
    type: string
    sql: ${TABLE}.ORDER_PREFIX ;;
    hidden: yes
  }

  dimension: order_source_cd {
    type: string
    sql: ${TABLE}.ORDER_SOURCE_CD ;;
  }

  dimension: order_source_name {
    type: string
    sql: ${TABLE}.ORDER_SOURCE_NAME ;;
  }

  dimension: src_order_no {
    label: "Order No"
    type: string
    sql: ${TABLE}.SRC_ORDER_NO ;;
  }
}
