view: order_line_f_test {
  sql_table_name: rpt.main.order_line_f ;;
  #-- measures

  measure: customer_cnt {
    label: "Customers"
    description: "Distinct Customer Count"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${TABLE}.customer_shk ;;
  }

  measure: customer_cnt_prev {
    label: "Customers"
    view_label: "1b) % Prev"
    type: percent_of_previous
    value_format: "0.0\%"
    sql: ${customer_cnt} ;;
  }

  measure: customer_cnt_pttl {
    label: "Customers"
    view_label: "1c) % Total"
    type: percent_of_total
    value_format: "0.0\%"
    sql: ${customer_cnt} ;;
  }

  measure: order_cnt {
    label: "Orders"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${TABLE}.order_shk ;;
    description: "Distinct Order Count"
  }

  measure: order_cnt_prev {
    label: "Orders"
    view_label: "1b) % Prev"
    type: percent_of_previous
    value_format: "0.0\%"
    sql: ${order_cnt} ;;
  }

  measure: order_cnt_pttl {
    label: "Orders"
    view_label: "1c) % Total"
    type: percent_of_total
    value_format: "0.0\%"
    sql: ${order_cnt} ;;
  }

  measure: order_line_cnt {
    label: "Order Lines"
    type: count
    value_format_name: decimal_0
  }

  measure: sku_cnt {
    label: "SKUs"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${TABLE}.product_shk ;;
    description: "Distinct SKU Count"
  }

  measure: first_order_dt {
    label: "Order Date:First"
    type: date
    sql: min( ${order_date_dm.cal_dt} ) ;;
    description: "Earliest Order Date"
  }

  measure: last_order_dt {
    label: "Order Date:Last"
    type: date
    sql: max( ${order_date_dm.cal_dt} ) ;;
    description: "Latest Order Date"
  }

  measure: order_date_cnt {
    label: "Order Date:Days"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${TABLE}.order_date_sid ;;
    description: "Distinct Order Date Count"
  }

  measure: first_ship_dt {
    label: "Ship Date:First"
    type: date
    sql: min( ${ship_date_dm.cal_dt} ) ;;
    description: "Earliest Ship Date"
  }

  measure: last_ship_dt {
    label: "Ship Date:Last"
    type: date
    sql: max( ${ship_date_dm.cal_dt} ) ;;
    description: "Latest Ship Date"
  }

  measure: ship_date_cnt {
    label: "Ship Date:Days"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${TABLE}.ship_date_sid ;;
    description: "Distinct Ship Date Count"
  }

  measure: avg_order_to_ship_day_cnt {
    label: "Ship Date:Avg Order to Ship Days"
    type: average
    value_format_name: decimal_0
    sql: datediff( day, ${order_date_dm.cal_dt}, ${ship_date_dm.cal_dt} ) ;;
    description: "Avg Days from Order to Ship Date"
  }

  measure: product_cost_amt {
    label: "Product Cost $"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.PRODUCT_COST_AMT ;;
    description: "Product Cost Amount."
  }

  measure: product_margin_amt {
    label: "Product Margin $"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.PRODUCT_MARGIN_AMT ;;
    description: "Product Margin Amount."
  }

  measure: product_margin_pct {
    label: "Product Margin %"
    type: number
    value_format_name: percent_1
    sql: ${product_margin_amt} / nullif( ${product_sales_amt}, 0 ) ;;
    description: "Product Margin / Product Sales."
  }

  measure: product_sales_amt {
    label: "Product Sales $"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.PRODUCT_SALES_AMT ;;
    description: "Price paid for product after discounts."
  }

  measure: product_sales_amt_prev {
    label: "Product Sales $"
    view_label: "1b) % Prev"
    type: percent_of_previous
    value_format: "0.0\%"
    sql: ${product_sales_amt} ;;
  }

  measure: product_sales_amt_pttl {
    label: "Product Sales $"
    view_label: "1c) % Total"
    type: percent_of_total
    value_format: "0.0\%"
    sql: ${product_sales_amt} ;;
  }

  measure: shipping_sales_amt {
    label: "Shipping Sales $"
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.SHIPPING_SALES_AMT ;;
    description: "Price paid for shipping after discounts."
  }

  measure: shipping_sales_amt_prev {
    label: "Shipping Sales $"
    view_label: "1b) % Prev"
    type: percent_of_previous
    value_format: "0.0\%"
    sql: ${shipping_sales_amt} ;;
  }

  measure: shipping_sales_amt_pttl {
    label: "Shipping Sales $"
    view_label: "1c) % Total"
    type: percent_of_total
    value_format: "0.0\%"
    sql: ${shipping_sales_amt} ;;
  }

  measure: sales_amt {
    label: "Sales $"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.SALES_AMT ;;
    description: "Product Sales + Shipping Sales"
  }

  measure: sales_amt_prev {
    label: "Sales $"
    view_label: "1b) % Prev"
    type: percent_of_previous
    value_format: "0.0\%"
    sql: ${sales_amt} ;;
  }

  measure: sales_amt_pttl {
    label: "Sales $"
    view_label: "1c) % Total"
    type: percent_of_total
    value_format: "0.0\%"
    sql: ${sales_amt} ;;
  }

  measure: sales_tax_amt {
    label: "Sales Tax $"
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.sales_tax_amt ;;
  }

  measure: unit_cnt {
    label: "Units"
    type: sum
    value_format_name: decimal_2
    sql: ${TABLE}.UNIT_CNT ;;
  }

  measure: avg_order_product_sales_amt {
    label: "AOV Product Sales $"
    type: number
    value_format_name: usd
    sql: ${product_sales_amt} / nullif( ${order_cnt}, 0 ) ;;
    description: "Product Sales / Orders"
  }

  measure: avg_order_sales_amt {
    label: "AOV Sales $"
    type: number
    value_format_name: usd
    sql: ${sales_amt} / nullif( ${order_cnt}, 0 ) ;;
    description: "Sales / Orders"
  }

  measure: avg_order_sales_amt_prev {
    label: "AOV Sales $"
    view_label: "1b) % Prev"
    type: percent_of_previous
    value_format: "0.0\%"
    sql: ${avg_order_sales_amt} ;;
  }

  measure: avg_order_unit_cnt {
    label: "Avg Order Units"
    type: number
    value_format_name: decimal_1
    sql: ${unit_cnt} / nullif( ${order_cnt}, 0 ) ;;
    description: "Units / Orders"
  }

  measure: avg_customer_product_margin_amt {
    label: "Avg Customer Product Margin $"
    type: number
    value_format_name: usd
    sql: ${product_margin_amt} / nullif( ${customer_cnt}, 0 ) ;;
    description: "Product Margin / Customers"
  }

  measure: avg_customer_sales_amt {
    label: "Avg Customer Sales $"
    type: number
    value_format_name: usd
    sql: ${sales_amt} / nullif( ${customer_cnt}, 0 ) ;;
    description: "Sales / Customers"
  }

  measure: avg_customer_amt {
    label: "Avg Customer Product Sales $"
    type: number
    value_format_name: usd
    sql: ${product_sales_amt} / nullif( ${customer_cnt}, 0 ) ;;
    description: "Product Sales / Customers"
  }

  measure: avg_customer_unit_cnt {
    label: "Avg Customer Units"
    type: number
    value_format_name: decimal_1
    sql: ${unit_cnt} / nullif( ${customer_cnt}, 0 ) ;;
    description: "Units / Customers"
  }

  measure: avg_sku_amt {
    label: "Avg SKU Product Sales $"
    type: number
    value_format_name: usd
    sql: ${product_sales_amt} / nullif( ${sku_cnt}, 0 ) ;;
    description: "Product Sales / SKUs"
  }

  measure: avg_sku_unit_cnt {
    label: "Avg SKU Units"
    type: number
    value_format_name: decimal_1
    sql: ${unit_cnt} / nullif( ${sku_cnt}, 0 ) ;;
    description: "Units / SKUs"
  }

  measure: avg_unit_product_cost_amt {
    label: "Avg Unit Product Cost $"
    type: number
    value_format_name: usd
    sql: ${product_cost_amt} / nullif( ${unit_cnt}, 0 ) ;;
    description: "Product Cost / Units"
  }

  measure: avg_unit_product_margin_amt {
    label: "Avg Unit Product Margin $"
    type: number
    value_format_name: usd
    sql: ${product_margin_amt} / nullif( ${unit_cnt}, 0 ) ;;
    description: "Product Margin / Units"
  }

  measure: avg_unit_productg_sales_amt {
    label: "Avg Unit Product Sales $"
    type: number
    value_format_name: usd
    sql: ${product_sales_amt} / nullif( ${unit_cnt}, 0 ) ;;
    description: "Product Sales / Units"
  }

  measure: avg_unit_product_sales_amt_prev {
    label: "Avg Unit Product Sales $"
    view_label: "1b) % Prev"
    type: percent_of_previous
    value_format: "0.0\%"
    sql: ${avg_unit_productg_sales_amt} ;;
  }

  #-- other

  dimension: billing_state_shk {
    type: string
    sql: ${TABLE}.BILLING_STATE_SHK ;;
    hidden: yes
  }

  dimension: customer_shk {
    type: string
    sql: ${TABLE}.CUSTOMER_SHK ;;
    hidden: yes
  }

  dimension: dlr_off_discount_amt {
    type: string
    sql: ${TABLE}.DLR_OFF_DISCOUNT_AMT ;;
    hidden: yes
  }

  dimension: order_date_sid {
    type: string
    sql: ${TABLE}.ORDER_DATE_SID ;;
    hidden: yes
  }

  dimension: order_date_hour {
    type: date_hour
    label: "Date Hour"
    description: "Date + hour of order."
    sql: ${TABLE}.order_dt ;;
  }

  dimension: order_date_hour_of_day {
    type: date_hour_of_day
    group_label: "Time"
    label: "Hour of Day"
    description: "Order date truncated to the nearest hour."
    sql: ${TABLE}.order_dt ;;
  }

  dimension: order_date_minute {
    type: date_minute
    label: "Date Minute"
    description: "Order date truncated to the nearest minute."
    sql: ${TABLE}.order_dt ;;
  }

  dimension: order_line_status_shk {
    type: string
    sql: ${TABLE}.ORDER_LINE_STATUS_SHK ;;
    hidden: yes
  }

  dimension: order_shk {
    type: string
    sql: ${TABLE}.ORDER_SHK ;;
    hidden: yes
  }

  dimension: order_line_shk {
    type: string
    sql: ${TABLE}.ORDER_LINE_SHK ;;
    hidden: yes
  }

  dimension: pct_off_discount_amt {
    type: string
    sql: ${TABLE}.PCT_OFF_DISCOUNT_AMT ;;
    hidden: yes
  }

  dimension: product_shk {
    type: string
    sql: ${TABLE}.PRODUCT_SHK ;;
    hidden: yes
  }

  dimension: sales_channel_shk {
    type: string
    sql: ${TABLE}.SALES_CHANNEL_SHK ;;
    hidden: yes
  }

  dimension: ship_date_sid {
    type: string
    sql: ${TABLE}.SHIP_DATE_SID ;;
    hidden: yes
  }

  dimension: system_sid {
    type: string
    sql: ${TABLE}.SYSTEM_SID ;;
    hidden: yes
  }
}
