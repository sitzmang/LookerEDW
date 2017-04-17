view: ddbs_sales_channel_f {
  sql_table_name: rpt.main.DDBS_SALES_CHANNEL_F ;;

  measure: bgt_visit_cnt {
    label: "Budget Visits"
    group_label: "Budget"
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.bgt_visit_cnt ;;
    hidden: no
  }

  measure: act_visit_cnt {
    label: "Actual Visits"
    group_label: "Actual"
    description: "Actual visit count."
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.act_visit_cnt;;
  }

  measure: visit_variance_amt {
    label: "Actual to Budget Visit Variance"
    description: "Actual visits - budget visits."
    group_label: "Variance"
    type: sum
    value_format_name: decimal_0
    sql:${TABLE}.act_visit_cnt - ${TABLE}.bgt_visit_cnt;;
  }

  measure: visit_variance_pct {
    label: "% Actual to Budget Visit Variance"
    group_label: "Variance"
    type: number
    value_format_name: percent_2
    sql: ${act_visit_cnt} / nullif( ${bgt_visit_cnt}, 0 ) ;;
    description: "Actual visits / budget visits."
  }

  measure: cumulative_bgt_visits_amt {
    label: "Cumulative Budget Visits"
    view_label: "1d) Cumulative"
    description: "Running total of budget visits."
    type: running_total
    value_format_name: decimal_0
    sql: ${bgt_visit_cnt} ;;
    hidden: no
  }

  measure: cumulative_act_visits_amt {
    label: "Cumulative Actual Visits"
    view_label: "1d) Cumulative"
    description: "Running total of actual visits."
    type: running_total
    value_format_name: decimal_0
    sql: ${act_visit_cnt} ;;
    hidden: no
  }

  measure: bgt_order_cnt {
    label: "Budget Orders"
    group_label: "Budget"
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.bgt_order_cnt ;;
    hidden: no
  }

  measure: act_order_cnt {
    label: "Actual Orders"
    group_label: "Actual"
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.act_order_cnt ;;
    hidden: no
  }

  measure: cumulative_bgt_orders_amt {
    label: "Cumulative Budget Orders"
    view_label: "1d) Cumulative"
    description: "Running total of budget orders."
    type: running_total
    value_format_name: decimal_0
    sql: ${bgt_order_cnt} ;;
    hidden: no
  }

  measure: cumulative_act_orders_amt {
    label: "Cumulative Actual Orders"
    view_label: "1d) Cumulative"
    description: "Running total of actual orders."
    type: running_total
    value_format_name: decimal_0
    sql: ${act_order_cnt} ;;
    hidden: no
  }

  measure: bgt_sales_amt {
    label: "Budget Sales $"
    group_label: "Budget"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.bgt_sales_amt ;;
    hidden: no
  }

  measure: act_sales_amt {
    label: "Actual Sales $"
    group_label: "Actual"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.act_sales_amt ;;
    hidden: no
  }

  measure: cumulative_bgt_sales_amt {
    label: "Cumulative Budget Sales $"
    view_label: "1d) Cumulative"
    description: "Running total of budget sales."
    type: running_total
    value_format_name: usd
    sql: ${bgt_sales_amt} ;;
    hidden: no
  }

  measure: cumulative_act_sales_amt {
    label: "Cumulative Actual Sales $"
    view_label: "1d) Cumulative"
    description: "Running total of actual sales."
    type: running_total
    value_format_name: usd
    sql: ${act_sales_amt} ;;
    hidden: no
  }

  measure: sales_variance_amt {
    label: "$ Actual to Budget Sales Variance"
    group_label: "Variance"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.act_sales_amt - ${TABLE}.bgt_sales_amt ;;
    hidden: no
    description: "Actual sales - budget sales."
  }

  measure: sales_variance_pct {
    label: "% Actual to Budget Sales Variance"
    group_label: "Variance"
    type: number
    value_format_name: percent_2
    sql: ${act_sales_amt} / nullif( ${bgt_sales_amt}, 0 ) ;;
    description: "Actual sales / budget sales."
  }

  measure: avg_order_sales_actual_amt {
    label: "Actual AOV Sales"
    group_label: "Actual"
    type: number
    value_format_name: usd
    sql: ${act_sales_amt} / nullif( ${act_order_cnt}, 0 ) ;;
    description: "Actual sales / actual orders."
  }

  measure: avg_order_sales_budget_amt {
    label: "Budget AOV Sales $"
    group_label: "Budget"
    type: number
    value_format_name: usd
    sql: ${bgt_sales_amt} / nullif( ${bgt_order_cnt}, 0 ) ;;
    description: "Budget sales / budget orders."
  }

  measure: order_conversion_rate {
    label: "Site Conversion"
    description: "Actual orders / actual visits."
    type: number
    value_format_name: percent_2
    sql: cast( ${act_order_cnt} as float)/NULLIF(${act_visit_cnt},0) ;;
  }

  measure: act_visit_cnt_prev {
    label: "Actual Visits"
    view_label: "1b) % Prev"
    type: percent_of_previous
    value_format: "0.0\%"
    sql: ${act_visit_cnt} ;;
  }

  measure: act_order_cnt_prev {
    label: "Actual Orders"
    view_label: "1b) % Prev"
    type: percent_of_previous
    value_format: "0.0\%"
    sql: ${act_order_cnt} ;;
  }

  measure: act_sales_amt_prev {
    label: "Actual Sales $"
    view_label: "1b) % Prev"
    type: percent_of_previous
    value_format:  "0.0\%"
    sql: ${act_sales_amt} ;;
  }

  measure: avg_order_sales_amt_prev {
    label: "Actual AOV Sales $"
    view_label: "1b) % Prev"
    type: percent_of_previous
    value_format: "0.0\%"
    sql: ${avg_order_sales_actual_amt} ;;
  }

  measure: order_conversion_rate_prev {
    label: "Site Conversion"
    view_label: "1b) % Prev"
    type: percent_of_previous
    value_format: "0.0\%"
    sql: ${order_conversion_rate} ;;
  }

  measure: act_visit_cnt_pttl {
    label: "Actual Visits"
    view_label: "1c) % Total"
    type: percent_of_total
    value_format: "0.0\%"
    sql: ${act_visit_cnt} ;;
  }

  measure: act_order_cnt_pttl {
    label: "Actual Orders"
    view_label: "1c) % Total"
    type: percent_of_total
    value_format: "0.0\%"
    sql: ${act_order_cnt} ;;
  }

  measure: act_sales_amt_pttl {
    label: "Actual Sales $"
    view_label: "1c) % Total"
    type: percent_of_total
    value_format: "0.0\%"
    sql: ${act_sales_amt} ;;
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
