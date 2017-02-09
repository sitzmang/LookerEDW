view: xds_sales_channel_f {
  sql_table_name: rpt.main.xds_sales_channel_f ;;


  measure: avg_visit_page_views {
    label: "Avg Visit Page Views"
    description: "Page Count / Visit Count"
    type: number
    value_format_name: decimal_2
    sql: ${page_cnt} / ${visit_cnt} ;;
  }

  measure: conversion_rate {
    label: "Order CVR"
    description: "Orders / Visits"
    type: number
    value_format_name: decimal_4
    sql: ${visit_order_bt} *  ${order_cnt} / ${visit_cnt} ;;
  }

  measure: order_cnt {
    label: "Orders"
    description: "Order Count"
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.order_cnt;;
  }

  measure: page_cnt {
    label: "Page Views"
    description: "Count of page views."
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.page_cnt ;;
  }

  measure: visit_cnt {
    label: "Visits"
    description: "Visit Count"
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.visit_cnt;;
  }

  measure: visit_order_bt {
    type: sum
    sql: ${TABLE}.visit_order_bt ;;
    description: "Identifies if orders can be aggregated for the purpose of calculating CVR."
    hidden: yes
  }

  dimension: request_date_sid {
    type: string
    sql: ${TABLE}.request_date_sid ;;
    hidden: yes
  }

  dimension: sales_channel_shk {
    type: string
    sql: ${TABLE}.SALES_CHANNEL_SHK ;;
    hidden: yes
  }
}
