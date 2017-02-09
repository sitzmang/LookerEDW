view: xds_sales_channel_f {
  sql_table_name: rpt.main.xds_sales_channel_f ;;

  measure: visits_cnt {
    label: "Visits"
    description: "Visit Count"
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.visits_cnt;;
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
    sql: (${TABLE}.visit_order_bt *  ${TABLE}.order_cnt) / ${visits_cnt} ;;
  }

  measure: avg_visits_page_views {
    label: "Average Visits Page Views"
    description: "Average Page Views per Visit"
    type: number
    value_format_name: decimal_2
    sql: ${TABLE}.page_cnt / ${visits_cnt} ;;
  }

  dimension: request_date_sid {
    type: string
    sql: ${TABLE}.request_date_sid ;;
    hidden: no
  }


}
