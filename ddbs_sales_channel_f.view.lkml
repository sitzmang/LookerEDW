view: ddbs_sales_channel_f {
  sql_table_name: rpt.main.DDBS_SALES_CHANNEL_F ;;

  measure: bgt_visit_cnt {
    label: "Visits (Budget)"
    group_label: "Budget"
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.bgt_visit_cnt ;;
    hidden: no
  }

  measure: act_visit_cnt {
    label: "Visits (Actual)"
    group_label: "Actual"
    description: "Actual visit count."
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.act_visit_cnt;;
  }

  measure: visit_variance_amt {
    label: "Visits (Var)"
    description: "Actual visits - budget visits."
    group_label: "Variance (Actual to Budget)"
    type: sum
    value_format_name: decimal_0
    sql:${TABLE}.act_visit_cnt - ${TABLE}.bgt_visit_cnt;;
  }

  measure: visit_variance_pct {
    label: "Visits (% Var)"
    group_label: "Variance (Actual to Budget)"
    type: number
    value_format_name: percent_1
    sql: (${act_visit_cnt} / nullif( ${bgt_visit_cnt}, 0 ))-1 ;;
    description: "Actual visits / budget visits."
  }

  measure: cumulative_bgt_visits_amt {
    label: "Cumulative Visits (Budget)"
    view_label: "1d) Cumulative"
    description: "Running total of budget visits."
    type: running_total
    value_format_name: decimal_0
    sql: ${bgt_visit_cnt} ;;
    hidden: no
  }

  measure: cumulative_act_visits_amt {
    label: "Cumulative Visits (Actual)"
    view_label: "1d) Cumulative"
    description: "Running total of actual visits."
    type: running_total
    value_format_name: decimal_0
    sql: ${act_visit_cnt} ;;
    hidden: no
  }

  measure: bgt_order_cnt {
    label: "Orders (Budget)"
    group_label: "Budget"
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.bgt_order_cnt ;;
    hidden: no
  }

  measure: act_order_cnt {
    label: "Orders (Actual)"
    group_label: "Actual"
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.act_order_cnt ;;
    hidden: no
  }

  measure: order_variance_amt {
    label: "Orders (Var)"
    description: "Actual orders - budget orders."
    group_label: "Variance (Actual to Budget)"
    type: sum
    value_format_name: decimal_0
    sql:${TABLE}.act_order_cnt - ${TABLE}.bgt_order_cnt;;
  }

  measure: order_variance_pct {
    label: "Orders (% Var)"
    group_label: "Variance (Actual to Budget)"
    type: number
    value_format_name: percent_1
    sql: (${act_order_cnt} / nullif( ${bgt_order_cnt}, 0 ))-1 ;;
    description: "Actual orders / budget orders."
  }

  measure: cumulative_bgt_orders_amt {
    label: "Cumulative Orders (Budget)"
    view_label: "1d) Cumulative"
    description: "Running total of budget orders."
    type: running_total
    value_format_name: decimal_0
    sql: ${bgt_order_cnt} ;;
    hidden: no
  }

  measure: cumulative_act_orders_amt {
    label: "Cumulative Orders (Actual)"
    view_label: "1d) Cumulative"
    description: "Running total of actual orders."
    type: running_total
    value_format_name: decimal_0
    sql: ${act_order_cnt} ;;
    hidden: no
  }

  measure: bgt_sales_amt {
    label: "Sales $ (Budget)"
    group_label: "Budget"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.bgt_sales_amt ;;
    hidden: no
  }

  measure: act_sales_amt {
    label: "Sales $ (Actual)"
    group_label: "Actual"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.act_sales_amt ;;
    hidden: no
  }

  measure: cumulative_bgt_sales_amt {
    label: "Cumulative Sales $ (Budget)"
    view_label: "1d) Cumulative"
    description: "Running total of budget sales."
    type: running_total
    value_format_name: usd
    sql: ${bgt_sales_amt} ;;
    hidden: no
  }

  measure: cumulative_act_sales_amt {
    label: "Cumulative Sales $ (Actual)"
    view_label: "1d) Cumulative"
    description: "Running total of actual sales."
    type: running_total
    value_format_name: usd
    sql: ${act_sales_amt} ;;
    hidden: no
  }

  measure: sales_variance_amt {
    label: "Sales $ (Var)"
    group_label: "Variance (Actual to Budget)"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.act_sales_amt - ${TABLE}.bgt_sales_amt ;;
    hidden: no
    description: "Actual sales - budget sales."
  }

  measure: sales_variance_pct {
    label: "Sales $ (% Var)"
    group_label: "Variance (Actual to Budget)"
    type: number
    value_format_name: percent_1
    sql: (${act_sales_amt} / nullif( ${bgt_sales_amt}, 0 ))-1 ;;
    description: "Actual sales / budget sales."
  }

  measure: avg_order_sales_actual_amt {
    label: "AOV (Actual)"
    group_label: "Actual"
    type: number
    value_format_name: usd
    sql: ${act_sales_amt} / nullif( ${act_order_cnt}, 0 ) ;;
    description: "Actual sales / actual orders."
  }

  measure: avg_order_sales_budget_amt {
    label: "AOV (Budget)"
    group_label: "Budget"
    type: number
    value_format_name: usd
    sql: ${bgt_sales_amt} / nullif( ${bgt_order_cnt}, 0 ) ;;
    description: "Budget sales / budget orders."
  }

  measure: avg_order_sales_variance_amt {
    label: "AOV (Var)"
    group_label: "Variance (Actual to Budget)"
    type: number
    value_format_name: usd
    sql: ${avg_order_sales_actual_amt} - ${avg_order_sales_budget_amt} ;;
    description: "AOV actual - AOV budget."
  }

  measure: avg_order_sales_variance_pct {
    label: "AOV (% Var)"
    group_label: "Variance (Actual to Budget)"
    type: number
    value_format_name: percent_1
    sql: (${avg_order_sales_actual_amt} / nullif( ${avg_order_sales_budget_amt}, 0 ))-1 ;;
    description: "AOV actual / AOV budget."
  }

  measure: act_order_conversion_rate {
    label: "Site Conversion (Actual)"
    group_label: "Actual"
    description: "Actual orders / actual visits."
    type: number
    value_format_name: percent_2
    sql: cast( ${act_order_cnt} as float)/NULLIF(${act_visit_cnt},0) ;;
  }

  measure: bgt_order_conversion_rate {
    label: "Site Conversion (Budget)"
    group_label: "Budget"
    description: "Budget orders / budget visits."
    type: number
    value_format_name: percent_2
    sql: cast( ${bgt_order_cnt} as float)/NULLIF(${bgt_visit_cnt},0) ;;
  }

  measure: act_visit_cnt_prev {
    label: "Visits (Actual)"
    view_label: "1b) % Prev"
    type: percent_of_previous
    value_format: "0.0\%"
    sql: ${act_visit_cnt} ;;
  }

  measure: act_order_cnt_prev {
    label: "Orders (Actual)"
    view_label: "1b) % Prev"
    type: percent_of_previous
    value_format: "0.0\%"
    sql: ${act_order_cnt} ;;
  }

  measure: act_sales_amt_prev {
    label: "Sales $ (Actual)"
    view_label: "1b) % Prev"
    type: percent_of_previous
    value_format:  "0.0\%"
    sql: ${act_sales_amt} ;;
  }

  measure: avg_order_sales_amt_prev {
    label: "AOV (Actual)"
    view_label: "1b) % Prev"
    type: percent_of_previous
    value_format: "0.0\%"
    sql: ${avg_order_sales_actual_amt} ;;
  }

  measure: order_conversion_rate_prev {
    label: "Site Conversion (Actual)"
    view_label: "1b) % Prev"
    type: percent_of_previous
    value_format: "0.0\%"
    sql: ${act_order_conversion_rate} ;;
  }

  measure: act_visit_cnt_pttl {
    label: "Visits (Actual)"
    view_label: "1c) % Total"
    type: percent_of_total
    value_format: "0.0\%"
    sql: ${act_visit_cnt} ;;
  }

  measure: act_order_cnt_pttl {
    label: "Orders (Actual)"
    view_label: "1c) % Total"
    type: percent_of_total
    value_format: "0.0\%"
    sql: ${act_order_cnt} ;;
  }

  measure: act_sales_amt_pttl {
    label: "Sales $ (Actual)"
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
