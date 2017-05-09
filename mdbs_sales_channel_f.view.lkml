view: mdbs_sales_channel_f {
  sql_table_name: rpt.main.mdbs_sales_channel_f ;;

# ---------------- Measures (Actual)

  measure: avg_order_sales_actual_amt {
    label: "AOV Sales $ (Actual)"
    group_label: "Actual"
    type: number
    value_format_name: usd
    sql: ${act_sales_amt} / nullif( ${act_order_cnt}, 0 ) ;;
    description: "Sales $ (Actual) / Orders (Actual)"
  }

  measure: avg_daily_orders_act {
    label: "Avg Daily Orders (Actual)"
    group_label: "Actual"
    type: number
    value_format_name: decimal_0
    description: "Orders (Actual) / Days"
    sql: ${act_order_cnt} / nullif(${act_day_cnt}, 0)  ;;
    hidden: no
  }

  measure: avg_daily_sales_act {
    label: "Avg Daily Sales $ (Actual)"
    group_label: "Actual"
    type: number
    value_format_name: usd_0
    description: "Sales $ (Actual) / Days"
    sql: ${act_sales_amt} / nullif(${act_day_cnt}, 0)  ;;
    hidden: no
  }

  measure: avg_daily_visits_act {
    label: "Avg Daily Visits (Actual)"
    group_label: "Actual"
    type: number
    value_format_name: decimal_0
    description: "Visits (Actual) / Days"
    sql: ${act_visit_cnt} / nullif(${act_day_cnt}, 0)  ;;
    hidden: no
  }

  measure: act_order_cnt {
    label: "Orders (Actual)"
    group_label: "Actual"
    description: "Count of distinct orders (Actual)."
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.act_order_cnt ;;
    hidden: no
  }

  measure: act_sales_amt {
    label: "Sales $ (Actual)"
    group_label: "Actual"
    type: sum
    value_format_name: usd_0
    description: "Product Sales $ (Actual) + Shipping Sales $ (Actual)"
    sql: ${TABLE}.act_sales_amt ;;
    hidden: no
  }

  measure: act_order_conversion_rate {
    label: "Site Conversion (Actual)"
    group_label: "Actual"
    description: "Orders (Actual) / Visits (Actual)"
    type: number
    value_format_name: percent_2
    sql: cast( ${act_order_cnt} as float)/NULLIF(${act_visit_cnt},0) ;;
  }

  measure: act_visit_cnt {
    label: "Visits (Actual)"
    group_label: "Actual"
    description: "Count of distinct visits to a site (Actual)."
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.act_visit_cnt;;
  }

# ---------------- Measures (Open)
  measure: open_order_cnt {
    label: "Orders (Open)"
    group_label: "Actual"
    description: "Count of distinct orders (Open)."
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.open_order_cnt ;;
    hidden: no
  }

  measure: open_sales_amt {
    label: "Sales $ (Open)"
    group_label: "Actual"
    type: sum
    value_format_name: usd_0
    description: "Product Sales $ (Open) + Shipping Sales $ (Open)"
    sql: ${TABLE}.open_sales_amt ;;
    hidden: no
  }


# ---------------- Measures (Budget)

  measure: avg_order_sales_budget_amt {
    label: "AOV Sales $ (Budget)"
    group_label: "Budget"
    type: number
    value_format_name: usd
    sql: ${bgt_sales_amt} / nullif( ${bgt_order_cnt}, 0 ) ;;
    description: "Sales $ (Budget) / Orders (Budget)"
  }

  measure: avg_daily_orders_bgt {
    label: "Avg Daily Orders (Budget)"
    group_label: "Budget"
    type: number
    value_format_name: decimal_0
    description: "Orders (Budget) / Days"
    sql: ${bgt_order_cnt} / (${act_day_cnt} + ${future_day_cnt});;
    hidden: no
  }

  measure: avg_daily_sales_bgt {
    label: "Avg Daily Sales $ (Budget)"
    group_label: "Budget"
    type: number
    value_format_name: usd_0
    description: "Sales $ (Budget) / Days"
    sql: ${bgt_sales_amt} / (${act_day_cnt} + ${future_day_cnt});;
    hidden: no
  }

  measure: avg_daily_visits_bgt {
    label: "Avg Daily Visits (Budget)"
    group_label: "Budget"
    type: number
    value_format_name: decimal_0
    description: "Visits (Budget) / Days"
    sql: ${bgt_visit_cnt} / (${act_day_cnt} + ${future_day_cnt});;
    hidden: no
  }

  measure: bgt_order_cnt {
    label: "Orders (Budget)"
    group_label: "Budget"
    description: "Count of distinct orders (Budget)."
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.bgt_order_cnt ;;
    hidden: no
  }

  measure: bgt_sales_amt {
    label: "Sales $ (Budget)"
    group_label: "Budget"
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.bgt_sales_amt ;;
    description: "Product Sales $ (Budget) + Shipping Sales $ (Budget)"
    hidden: no
  }

  measure: bgt_order_conversion_rate {
    label: "Site Conversion (Budget)"
    group_label: "Budget"
    description: "Orders (Budget) / Visits (Budget)"
    type: number
    value_format_name: percent_2
    sql: cast( ${bgt_order_cnt} as float)/NULLIF(${bgt_visit_cnt},0) ;;
  }

  measure: bgt_visit_cnt {
    label: "Visits (Budget)"
    description: "Count of distinct visits to a site (Budget)."
    group_label: "Budget"
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.bgt_visit_cnt ;;
    hidden: no
  }

# ---------------- Measures (Needed)

  measure: avg_daily_orders_needed {
    label: "Avg Daily Orders (Needed)"
    group_label: "Needed"
    type: number
    value_format_name: decimal_0
    description: "Average daily orders needed to meet budget."
    sql: (${bgt_order_cnt} - ${act_order_cnt}) / nullif(${future_day_cnt}, 0)  ;;
    hidden: no
  }

  measure: avg_daily_sales_needed {
    label: "Avg Daily Sales $ (Needed)"
    group_label: "Needed"
    type: number
    value_format_name: usd_0
    description: "Average daily sales needed to meet budget."
    sql: (${bgt_sales_amt} - ${act_sales_amt}) / nullif(${future_day_cnt}, 0)  ;;
    hidden: no
  }

  measure: avg_daily_visits_needed {
    label: "Avg Daily Visits (Needed)"
    group_label: "Needed"
    type: number
    value_format_name: decimal_0
    description: "Average daily visits needed to meet budget."
    sql: (${bgt_visit_cnt} - ${act_visit_cnt}) / nullif(${future_day_cnt}, 0)  ;;
    hidden: no
  }

  measure: future_day_cnt {
    label: "Remaining Days"
    group_label: "Needed"
    description: "Period day count - actual day count."
    type: number
    value_format_name: decimal_0
    sql: ${period_day_cnt} - ${act_day_cnt} ;;
    hidden: no
  }

# ---------------- Measures (Projected/Estimate)

  measure: est_order_cnt {
    label: "Orders (Projected)"
    group_label: "Projected"
    type: sum
    value_format_name: decimal_0
    description: "Current month: Avg Daily Orders (Actual) * Days in Month; Prior months: Orders (Actual); Future months: Orders (Budget)."
    sql: ${TABLE}.est_order_cnt ;;
    hidden: no
  }

  measure: est_sales_amt {
    label: "Sales $ (Projected)"
    group_label: "Projected"
    type: sum
    value_format_name: usd_0
    description: "Current month: Avg Daily Sales $ (Actual) * Days in Month; Prior months: Sales $ (Actual); Future months: Sales $ (Budget)."
    sql: ${TABLE}.est_sales_amt ;;
    ## html: <a title = "Prior months = actual sales; future months = budget sales; current month = straight line predicted sales." </a> {{ _field._name }};;
    hidden: no
  }

  measure: est_visit_amt {
    label: "Visits (Projected)"
    group_label: "Projected"
    type: sum
    value_format_name: decimal_0
    description: "Current month: Avg Daily Visits (Actual) * Days in Month; Prior months: Visits (Actual); Future months: Visits (Budget)."
    sql: ${TABLE}.est_visit_cnt ;;
    hidden: no
  }

  measure: avg_daily_sales_est {
    label: "Avg Daily Sales $ (Projected)"
    group_label: "Projected"
    type: number
    value_format_name: usd_0
    description: "Estimate sales / period day count."
    sql: ${est_sales_amt} / ${period_day_cnt}  ;;
    hidden: yes
  }

  measure: avg_daily_visits_est {
    label: "Avg Daily Visits (Estimate)"
    group_label: "Estimate"
    type: number
    value_format_name: decimal_0
    description: "Estimated visits / period day count."
    sql: ${est_visit_amt} / ${period_day_cnt}  ;;
    hidden: yes
  }

  measure: avg_daily_orders_est {
    label: "Avg Daily Orders (Projected)"
    group_label: "Projected"
    type: number
    value_format_name: decimal_0
    description: "Estimated orders / period day count."
    sql: ${est_order_cnt} / ${period_day_cnt}  ;;
    hidden: yes
  }

  measure: avg_order_sales_estimate_amt {
    label: "AOV (Projected)"
    group_label: "Projected"
    type: number
    value_format_name: usd
    sql: ${est_sales_amt} / nullif( ${est_order_cnt}, 0 ) ;;
    hidden: yes
  }

# ---------------- Measures (Variance)

  measure: avg_order_sales_variance_amt {
    label: "AOV Sales $ (Var)"
    group_label: "Variance to Budget"
    type: number
    value_format: "$#,##0.00;($#,##0.00)"
    html: {% if value < 0 %}
          <div style="color:red">{{rendered_value}}</div>
          {% elsif value > 0 %}
          <div style="color:black"><b>{{rendered_value}}</b></div>
          {% endif %};;
    sql: ${avg_order_sales_estimate_amt} - ${avg_order_sales_budget_amt} ;;
    description: "AOV Sales $ (Actual) - AOV Sales $ (Budget)"
  }

  measure: avg_order_sales_variance_pct {
    label: "AOV Sales $ (% Var)"
    group_label: "Variance to Budget"
    type: number
    value_format: "0.0%;(0.0%)"
    html: {% if value < 0 %}
          <div style="color:red">{{rendered_value}}</div>
          {% elsif value > 0 %}
          <div style="color:black"><b>{{rendered_value}}</b></div>
          {% endif %};;
    sql: (${avg_order_sales_estimate_amt} / nullif( ${avg_order_sales_budget_amt}, 0 ))-1 ;;
    description: "AOV Sales $ (Actual) / AOV Sales $ (Budget)"
  }

  measure: order_variance_amt {
    label: "Orders (Var)"
    description: "Orders (Actual) - Orders (Budget)"
    group_label: "Variance to Budget"
    type: sum
    value_format: "#,##0;(#,##0)"
    html: {% if value < 0 %}
          <div style="color:red">{{rendered_value}}</div>
          {% elsif value > 0 %}
          <div style="color:black"><b>{{rendered_value}}</b></div>
          {% endif %};;
    sql:${TABLE}.est_order_cnt - ${TABLE}.bgt_order_cnt;;
  }

  measure: order_variance_pct {
    label: "Orders (% Var)"
    group_label: "Variance to Budget"
    type: number
    value_format: "0.0%;(0.0%)"
    html: {% if value < 0 %}
          <div style="color:red">{{rendered_value}}</div>
          {% elsif value > 0 %}
          <div style="color:black"><b>{{rendered_value}}</b></div>
          {% endif %};;
    sql: (${est_order_cnt} / nullif( ${bgt_order_cnt}, 0 ))-1 ;;
    description: "Orders (Actual) / Orders (Budget)"
  }

  measure: sales_variance_amt {
    label: "Sales $ (Var)"
    group_label: "Variance to Budget"
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.est_sales_amt - ${TABLE}.bgt_sales_amt ;;
    html: {% if value < 0 %}
          <div style="color:red">{{rendered_value}}</div>
          {% elsif value > 0 %}
          <div style="color:black"><b>{{rendered_value}}</b></div>
          {% endif %};;
    hidden: no
    description: "Sales $ (Actual) - Sales $ (Budget)"
  }

  measure: sales_variance_pct {
    label: "Sales $ (% Var)"
    group_label: "Variance to Budget"
    type: number
    value_format: "0.0%;(0.0%)"
    html: {% if value < 0 %}
          <div style="color:red">{{rendered_value}}</div>
          {% elsif value > 0 %}
          <div style="color:black"><b>{{rendered_value}}</b></div>
          {% endif %};;
    sql: (${est_sales_amt} / nullif( ${bgt_sales_amt}, 0 ))-1 ;;
    description: "Sales $ (Actual) / Sales $ (Budget)"
  }

  measure: order_conversion_rate_variance_pct {
    label: "Site Conversion (% Var)"
    group_label: "Variance to Budget"
    type: number
    value_format: "0.0%;(0.0%)"
    html: {% if value < 0 %}
          <div style="color:red">{{rendered_value}}</div>
          {% elsif value > 0 %}
          <div style="color:black"><b>{{rendered_value}}</b></div>
          {% endif %};;
    sql: (${act_order_conversion_rate} / nullif( ${bgt_order_conversion_rate}, 0 ))-1 ;;
    description: "Site conversion (Actual)  / Site conversion (Budget)"
  }

  measure: visit_variance_amt {
    label: "Visits (Var)"
    description: "Vists (Actual) - Visits (Budget)"
    group_label: "Variance to Budget"
    type: sum
    value_format: "#,##0;(#,##0)"
    html: {% if value < 0 %}
          <div style="color:red">{{rendered_value}}</div>
          {% elsif value > 0 %}
          <div style="color:black"><b>{{rendered_value}}</b></div>
          {% endif %};;
    sql:${TABLE}.est_visit_cnt - ${TABLE}.bgt_visit_cnt;;
  }

  measure: visit_variance_pct {
    label: "Visits (% Var)"
    group_label: "Variance to Budget"
    type: number
    value_format: "0.0%;(0.0%)"
    html: {% if value < 0 %}
          <div style="color:red">{{rendered_value}}</div>
          {% elsif value > 0 %}
          <div style="color:black"><b>{{rendered_value}}</b></div>
          {% endif %};;
    sql: (${est_visit_amt} / nullif( ${bgt_visit_cnt}, 0 ))-1 ;;
    description: "Visits (Actual) / Visits (Budget)"
  }

# ---------------- Measures (% Prev)

  measure: avg_order_sales_amt_prev {
    label: "AOV Sales $ (Actual)"
    view_label: "1b) % Prev"
    type: percent_of_previous
    value_format: "0.0\%"
    sql: ${avg_order_sales_actual_amt} ;;
    description: "(AOV Sales $ (Actual: Current Period) - AOV Sales $ (Actual: Previous Period)) / AOV Sales $ (Actual: Current Period)"
  }

  measure: act_order_cnt_prev {
    label: "Orders (Actual)"
    view_label: "1b) % Prev"
    type: percent_of_previous
    value_format: "0.0\%"
    sql: ${act_order_cnt} ;;
    description: "(Orders (Actual: Current Period) - Orders (Actual: Previous Period)) / Orders (Actual: Current Period)"
  }

  measure: act_sales_amt_prev {
    label: "Sales $ (Actual)"
    view_label: "1b) % Prev"
    type: percent_of_previous
    value_format:  "0.0\%"
    sql: ${act_sales_amt} ;;
    description: "(Sales $ (Actual: Current Period) - Sales $ (Actual: Previous Period)) / Sales $ (Actual: Current Period)"
  }

  measure: order_conversion_rate_prev {
    label: "Site Conversion (Actual)"
    view_label: "1b) % Prev"
    type: percent_of_previous
    value_format: "0.0\%"
    sql: ${act_order_conversion_rate} ;;
    description: "(Site Conversion (Actual: Current Period) - Site Conversion (Actual: Previous Period)) / Site Conversion (Actual: Current Period)"
  }

  measure: act_visit_cnt_prev {
    label: "Visits (Actual)"
    view_label: "1b) % Prev"
    type: percent_of_previous
    value_format: "0.0\%"
    sql: ${act_visit_cnt} ;;
    description: "(Visits (Actual: Current Period) - Visits (Actual: Previous Period)) / Visits (Actual: Current Period)"
  }

# ---------------- Measures (% Total)

  measure: act_visit_cnt_pttl {
    label: "Visits (Actual)"
    view_label: "1c) % Total"
    type: percent_of_total
    value_format: "0.0\%"
    sql: ${act_visit_cnt} ;;
    description: "Visits (Actual: Current Period) / Visits (Actual: All Periods)"
  }

  measure: act_order_cnt_pttl {
    label: "Orders (Actual)"
    view_label: "1c) % Total"
    type: percent_of_total
    value_format: "0.0\%"
    sql: ${act_order_cnt} ;;
    description: "Orders (Actual: Current Period) / Orders (Actual: All Periods)"
  }

  measure: act_sales_amt_pttl {
    label: "Sales $ (Actual)"
    view_label: "1c) % Total"
    type: percent_of_total
    value_format: "0.0\%"
    sql: ${act_sales_amt} ;;
    description: "Sales $ (Actual: Current Period) / Sales $ (Actual: All Periods)"
  }

# ---------------- Measures (Cumulative)

  measure: cumulative_bgt_visits_amt {
    label: "Visits (Budget)"
    view_label: "1d) Cumulative"
    description: "Running total of Visits (Budget)."
    type: running_total
    value_format_name: decimal_0
    sql: ${bgt_visit_cnt} ;;
    hidden: no
  }

  measure: cumulative_act_visits_amt {
    label: "Visits (Actual)"
    view_label: "1d) Cumulative"
    description: "Running total of Visits (Actual)."
    type: running_total
    value_format_name: decimal_0
    sql: ${act_visit_cnt} ;;
    hidden: no
  }

  measure: cumulative_bgt_orders_amt {
    label: "Orders (Budget)"
    view_label: "1d) Cumulative"
    description: "Running total of Orders (Budget)."
    type: running_total
    value_format_name: decimal_0
    sql: ${bgt_order_cnt} ;;
    hidden: no
  }

  measure: cumulative_act_orders_amt {
    label: "Orders (Actual)"
    view_label: "1d) Cumulative"
    description: "Running total of Orders (Actual)."
    type: running_total
    value_format_name: decimal_0
    sql: ${act_order_cnt} ;;
    hidden: no
  }

  measure: cumulative_bgt_sales_amt {
    label: "Sales $ (Budget)"
    view_label: "1d) Cumulative"
    description: "Running total of Sales $ (Budget)."
    type: running_total
    value_format_name: usd_0
    sql: ${bgt_sales_amt} ;;
    hidden: no
  }

  measure: cumulative_act_sales_amt {
    label: "Sales $ (Actual)"
    view_label: "1d) Cumulative"
    description: "Running total of Sales $ (Actual)."
    type: running_total
    value_format_name: usd_0
    sql: ${act_sales_amt} ;;
    hidden: no
  }

# ---------------- Measures (misc)

  measure: period_day_cnt {
    label: "Period Day Count"
    description: "Total days occurring within period."
    type: sum_distinct
    value_format_name: decimal_0
    sql: ${TABLE}.period_day_cnt ;;
    sql_distinct_key:${TABLE}.date_sid ;;
    hidden: yes
  }

  measure: act_day_cnt {
    label: "Actual Day Count"
    description: "Total elapsed days within period thru eod yesterday."
    type: sum_distinct
    value_format_name: decimal_0
    sql: ${TABLE}.act_day_cnt ;;
    sql_distinct_key:${TABLE}.date_sid ;;
    hidden: yes
  }

# ---------------- Dimensions

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
