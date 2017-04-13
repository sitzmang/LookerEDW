view: ddbs_sales_channel_f {
  sql_table_name: rpt.main.DDBS_SALES_CHANNEL_F ;;

  measure: bgt_visit_cnt {
    label: "Budget Visits"
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.bgt_visit_cnt ;;
    hidden: no
  }

  measure: act_visit_cnt {
    label: "Actual Visits"
    description: "Actual Visit Count"
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.act_visit_cnt;;
  }

  measure: bgt_order_cnt {
    label: "Budget Orders"
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.bgt_order_cnt ;;
    hidden: no
  }

  measure: act_order_cnt {
    label: "Actual Orders"
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.act_order_cnt ;;
    hidden: no
  }

  measure: bgt_sales_amt {
    label: "Budget Sales"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.bgt_sales_amt ;;
    hidden: no
  }

  measure: act_sales_amt {
    label: "Actual Sales"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.act_sales_amt ;;
    hidden: no
  }

  measure: sales_variance_amt {
    label: "Actual Sales - Budget Sales"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.act_sales_amt - ${TABLE}.bgt_sales_amt ;;
    hidden: no
    description: "Actual Sales - Budget Sales"
  }

  measure: sales_variance_pct {
    label: "Percent Actual Sales to Budget"
    type: number
    value_format_name: percent_2
    sql: ${act_sales_amt} / nullif( ${bgt_sales_amt}, 0 ) ;;
    description: "Actual Sales / Budget Sales"
  }

  measure: avg_order_sales_actual_amt {
    label: "Actual AOV Sales"
    type: number
    value_format_name: usd
    sql: ${act_sales_amt} / nullif( ${act_order_cnt}, 0 ) ;;
    description: "Actual Sales / Actual Orders"
  }

  measure: avg_order_sales_budget_amt {
    label: "Budget AOV Sales $"
    type: number
    value_format_name: usd
    sql: ${bgt_sales_amt} / nullif( ${bgt_order_cnt}, 0 ) ;;
    description: "Budget Sales / Budget Orders"
  }

  measure: order_conversion_rate {
    label: "Site Conversion"
    ##group_label:"Visits"
    description: "Actual orders / actual visits"
    type: number
    value_format_name: percent_2
    sql: cast( ${act_order_cnt} as float)/NULLIF(${act_visit_cnt},0) ;;
  }

  dimension: sales_channel_shk {
    type: string
    sql: ${TABLE}.sales_channel_shk ;;
    hidden: yes
  }

  dimension: date_sid {
    type: number
    sql: ${TABLE}.date_sid ;;
    hidden: yes
  }

}
