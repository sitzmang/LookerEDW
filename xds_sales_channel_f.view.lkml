view: xds_sales_channel_f {
  sql_table_name: rpt.main.xds_sales_channel_f ;;

  measure: visit_cnt {
    label: "Visits"
    description: "Visit Count"
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.visit_cnt;;
  }

  measure: page_cnt {
    label: "Page Views"
    description: "Count of page views."
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.page_cnt ;;
  }

  measure: conversion_rate {
    label: "Conversion "
    description: "Orders / Visits"
    type: number
    value_format_name: decimal_4
    sql: ($visit_order_bt *  $order_cnt) / $visit_cnt ;;
  }

  measure: avg_visit_page_views {
    label: "Average Visit Page Views"
    description: "Average Page Views per Visit"
    type: number
    value_format_name: decimal_2
    sql: ${TABLE}.page_cnt / ${TABLE}.visit_cnt ;;
  }

  measure: order_cnt {
    label: "Orders"
    description: "Order Count"
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.order_cnt;;
  }

  measure: visit_order_bt {
    label: "Visit order"
    type: sum
    sql: ${TABLE}.visit_order_bt ;;
    description: "Count of days with online visit orders???"
  }

  dimension: request_date_sid {
    type: string
    sql: ${TABLE}.request_date_sid ;;
    hidden: no
  }

  dimension: sales_channel_shk {
    type: string
    sql: ${TABLE}.SALES_CHANNEL_SHK ;;
    hidden: yes
  }


}
