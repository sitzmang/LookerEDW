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
    sql: (${TABLE}.visit_order_bt *  ${TABLE}.order_cnt) / ${TABLE}.visit_cnt ;;
  }

  measure: avg_visit_page_views {
    label: "Average Visit Page Views"
    description: "Average Page Views per Visit"
    type: number
    value_format_name: decimal_2
    sql: ${TABLE}.page_cnt / ${TABLE}.visit_cnt ;;
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

  dimension: visit_order_bt {
    type: number
    sql: ${TABLE}.visit_order_bt ;;
    hidden: yes
  }


}
