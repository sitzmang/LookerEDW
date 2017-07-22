view: order_line_f2 {
    sql_table_name: RPT.MAIN.ORDER_LINE_F2 ;;
    #-- measures

    measure: customer_cnt {
      label: "Customers"
      group_label: "Customers"
      description: "Count of distinct customers."
      type: count_distinct
      value_format_name: decimal_0
      sql: case when ${customer_dm.email_adrs} like '%@%.%' then ${customer_dm.email_adrs} else ${TABLE}.customer_shk end ;;
    }

    measure: customer_cnt_prev {
      label: "Customers"
      view_label: "1b) % Prev"
      type: percent_of_previous
      value_format: "0.0\%"
      sql: ${customer_cnt} ;;
      description: "(Customers (Current Period) - Customers (Previous Period)) / Customers (Current Period)"
    }

    measure: customer_cnt_pttl {
      label: "Customers"
      view_label: "1c) % Total"
      type: percent_of_total
      value_format: "0.0\%"
      sql: ${customer_cnt} ;;
      description: "Customers (Current Period) / Customers (All Periods)"
    }

    measure: order_cnt {
      label: "Orders"
      group_label: "Orders / Units / SKUs"
      type: count_distinct
      value_format_name: decimal_0
      sql: ${TABLE}.order_shk ;;
      description: "Count of distinct orders."
    }

    measure: order_sku_cnt {
      type: count_distinct
      value_format_name: decimal_0
      sql: ${TABLE}.order_shk || '|' ||  ${TABLE}.product_shk;;
      description: "Distinct Order/SKU Combination Count"
      hidden: yes
    }

    measure: order_cnt_prev {
      label: "Orders"
      view_label: "1b) % Prev"
      type: percent_of_previous
      value_format: "0.0\%"
      sql: ${order_cnt} ;;
      description: "(Orders (Current Period) - Orders (Previous Period)) / Orders (Current Period)"
    }

    measure: order_cnt_pttl {
      label: "Orders"
      view_label: "1c) % Total"
      type: percent_of_total
      value_format: "0.0\%"
      sql: ${order_cnt} ;;
      description: "Orders (Current Period) / Orders (All Periods)"
    }

    measure: order_line_cnt {
      label: "Order Lines"
      group_label: "Orders / Units / SKUs"
      type: count
      value_format_name: decimal_0
    }

    measure: sku_cnt {
      label: "SKUs"
      group_label: "Orders / Units / SKUs"
      type: count_distinct
      value_format_name: decimal_0
      sql: ${TABLE}.product_shk ;;
      description: "Count of distinct SKUs."
    }

    measure: sku_cnt_pttl {
      label: "SKUs"
      view_label: "1c) % Total"
      type: percent_of_total
      value_format: "0.0\%"
      sql: ${sku_cnt} ;;
      description: "SKUs (Current Period) / SKUs (All Periods)"
    }

    measure: first_order_dt {
      label: "Order Date:First"
      group_label: "Order / Ship Dates"
      type: date
      sql: min( ${order_date_dm.cal_dt} ) ;;
      description: "Earliest order date."
    }

    measure: last_order_dt {
      label: "Order Date:Last"
      group_label: "Order / Ship Dates"
      type: date
      sql: max( ${order_date_dm.cal_dt} ) ;;
      description: "Latest order date."
    }

    measure: order_date_cnt {
      label: "Order Date:Days"
      group_label: "Order / Ship Dates"
      type: count_distinct
      value_format_name: decimal_0
      sql: ${TABLE}.order_date_sid ;;
      description: "Count of distinct order dates."
    }

    measure: first_ship_dt {
      label: "Ship Date:First"
      group_label: "Order / Ship Dates"
      type: date
      sql: min( ${ship_date_dm.cal_dt} ) ;;
      description: "Earliest ship date."
    }

    measure: last_ship_dt {
      label: "Ship Date:Last"
      group_label: "Order / Ship Dates"
      type: date
      sql: max( ${ship_date_dm.cal_dt} ) ;;
      description: "Latest ship date."
    }

    measure: ship_date_cnt {
      label: "Ship Date:Days"
      group_label: "Order / Ship Dates"
      type: count_distinct
      value_format_name: decimal_0
      sql: ${TABLE}.ship_date_sid ;;
      description: "Count of distinct ship dates."
    }

    measure: avg_order_to_ship_day_cnt {
      label: "Ship Date:Avg Order to Ship Days"
      group_label: "Order / Ship Dates"
      type: average
      value_format_name: decimal_0
      sql: datediff( day, ${order_date_dm.cal_dt}, ${ship_date_dm.cal_dt} ) ;;
      description: "Average days from order to ship date."
    }

    measure: product_cost_amt {
      label: "Product Cost $"
      group_label: "Sales / Cost / Margin"
      type: sum
      value_format_name: usd
      sql: ${TABLE}.PRODUCT_COST_AMT ;;
      description: "Product cost amount."
    }

    measure: product_margin_amt {
      label: "Product Margin $"
      group_label: "Sales / Cost / Margin"
      type: sum
      value_format_name: usd
      sql: ${TABLE}.PRODUCT_MARGIN_AMT ;;
      description: "Product margin amount."
    }

    measure: product_margin_pct {
      label: "Product Margin %"
      group_label: "Sales / Cost / Margin"
      type: number
      value_format_name: percent_1
      sql: ${product_margin_amt} / nullif( ${product_sales_amt}, 0 ) ;;
      description: "Product Margin $ / Product Sales $"
    }

    measure: product_sales_amt {
      label: "Product Sales $"
      group_label: "Sales / Cost / Margin"
      type: sum
      value_format_name: usd
      sql: ${TABLE}.PRODUCT_SALES_AMT ;;
      description: "Product sales net of discounts."
    }

    measure: product_sales_amt_prev {
      label: "Product Sales $"
      view_label: "1b) % Prev"
      type: percent_of_previous
      value_format: "0.0\%"
      sql: ${product_sales_amt} ;;
      description: "(Product Sales $ (Current Period) - Product Sales $ (Previous Period)) / Product Sales $ (Current Period)"
    }

    measure: product_sales_amt_pttl {
      label: "Product Sales $"
      view_label: "1c) % Total"
      type: percent_of_total
      value_format: "0.0\%"
      sql: ${product_sales_amt} ;;
      description: "Product Sales $ (Current Period) / Product Sales $ (All Periods)"
    }

    measure: shipping_sales_amt {
      label: "Shipping Sales $"
      group_label: "Sales / Cost / Margin"
      type: sum
      value_format_name: usd_0
      sql: ${TABLE}.SHIPPING_SALES_AMT ;;
      description: "Shipping sales net of discounts."
    }

    measure: shipping_sales_amt_prev {
      label: "Shipping Sales $"
      view_label: "1b) % Prev"
      type: percent_of_previous
      value_format: "0.0\%"
      sql: ${shipping_sales_amt} ;;
      description: "(Shipping Sales $ (Current Period) - Shipping Sales $ (Previous Period)) / Shipping Sales $ (Current Period)"
    }

    measure: shipping_sales_amt_pttl {
      label: "Shipping Sales $"
      view_label: "1c) % Total"
      type: percent_of_total
      value_format: "0.0\%"
      sql: ${shipping_sales_amt} ;;
      description: "Shipping Sales $ (Current Period) / Shipping Sales $ (All Periods)"
    }

    measure: sales_amt {
      label: "Sales $"
      group_label: "Sales / Cost / Margin"
      type: sum
      value_format_name: usd
      sql: ${TABLE}.SALES_AMT ;;
      description: "Product Sales $ + Shipping Sales $"
    }

    measure: sales_amt_prev {
      label: "Sales $"
      view_label: "1b) % Prev"
      type: percent_of_previous
      value_format: "0.0\%"
      sql: ${sales_amt} ;;
      description: "(Sales $ (Current Period) - Sales $ (Previous Period)) / Sales $ (Current Period)"
    }

    measure: sales_amt_pttl {
      label: "Sales $"
      view_label: "1c) % Total"
      type: percent_of_total
      value_format: "0.0\%"
      sql: ${sales_amt} ;;
      description: "Sales $ (Current Period) / Sales $ (All Periods)"
    }

    measure: sales_tax_amt {
      label: "Sales Tax $"
      group_label: "Sales / Cost / Margin"
      type: sum
      value_format_name: usd_0
      sql: ${TABLE}.sales_tax_amt ;;
    }

    measure: unit_cnt {
      label: "Units"
      group_label: "Orders / Units / SKUs"
      type: sum
      value_format_name: decimal_2
      sql: ${TABLE}.UNIT_CNT ;;
      description: "Sum of units per order."
    }

    measure: avg_order_product_sales_amt {
      label: "AOV Product Sales $"
      group_label: "Sales / Cost / Margin"
      type: number
      value_format_name: usd
      sql: ${product_sales_amt} / nullif( ${order_cnt}, 0 ) ;;
      description: "Product Sales $ / Orders"
    }

    measure: avg_order_sales_amt {
      label: "AOV Sales $"
      group_label: "Sales / Cost / Margin"
      type: number
      value_format_name: usd
      sql: ${sales_amt} / nullif( ${order_cnt}, 0 ) ;;
      description: "Sales $ / Orders"
    }

    measure: avg_order_sales_amt_prev {
      label: "AOV Sales $"
      view_label: "1b) % Prev"
      type: percent_of_previous
      value_format: "0.0\%"
      sql: ${avg_order_sales_amt} ;;
      description: "(AOV Sales $ (Current Period) - AOV Sales $ (Previous Period)) / AOV Sales $ (Current Period)"
    }

    measure: avg_order_sku_cnt {
      label: "Avg Order SKUs"
      group_label: "Orders / Units / SKUs"
      type: number
      value_format_name: decimal_1
      sql: ${order_sku_cnt} / nullif( ${order_cnt}, 0 ) ;;
      description: "SKUs / Orders"
    }

    measure: avg_order_unit_cnt {
      label: "Avg Order Units"
      group_label: "Orders / Units / SKUs"
      type: number
      value_format_name: decimal_1
      sql: ${unit_cnt} / nullif( ${order_cnt}, 0 ) ;;
      description: "Units / Orders"
    }

    measure: avg_customer_product_margin_amt {
      label: "Avg Customer Product Margin $"
      group_label: "Customers"
      type: number
      value_format_name: usd
      sql: ${product_margin_amt} / nullif( ${customer_cnt}, 0 ) ;;
      description: "Product Margin $ / Customers"
    }

    measure: avg_customer_sales_amt {
      label: "Avg Customer Sales $"
      group_label: "Customers"
      type: number
      value_format_name: usd
      sql: ${sales_amt} / nullif( ${customer_cnt}, 0 ) ;;
      description: "Sales $ / Customers"
    }

    measure: avg_customer_amt {
      label: "Avg Customer Product Sales $"
      group_label: "Customers"
      type: number
      value_format_name: usd
      sql: ${product_sales_amt} / nullif( ${customer_cnt}, 0 ) ;;
      description: "Product Sales $ / Customers"
    }

    measure: avg_customer_unit_cnt {
      label: "Avg Customer Units"
      group_label: "Customers"
      type: number
      value_format_name: decimal_1
      sql: ${unit_cnt} / nullif( ${customer_cnt}, 0 ) ;;
      description: "Units / Customers"
    }

    measure: avg_sku_amt {
      label: "Avg SKU Product Sales $"
      group_label: "Orders / Units / SKUs"
      type: number
      value_format_name: usd
      sql: ${product_sales_amt} / nullif( ${sku_cnt}, 0 ) ;;
      description: "Product Sales $ / SKUs"
    }

    measure: avg_sku_unit_cnt {
      label: "Avg SKU Units"
      group_label: "Orders / Units / SKUs"
      type: number
      value_format_name: decimal_1
      sql: ${unit_cnt} / nullif( ${sku_cnt}, 0 ) ;;
      description: "Units / SKUs"
    }

    measure: avg_unit_product_cost_amt {
      label: "Avg Unit Product Cost $"
      group_label: "Sales / Cost / Margin"
      type: number
      value_format_name: usd
      sql: ${product_cost_amt} / nullif( ${unit_cnt}, 0 ) ;;
      description: "Product Cost $ / Units"
    }

    measure: avg_unit_product_margin_amt {
      label: "Avg Unit Product Margin $"
      group_label: "Sales / Cost / Margin"
      type: number
      value_format_name: usd
      sql: ${product_margin_amt} / nullif( ${unit_cnt}, 0 ) ;;
      description: "Product Margin $ / Units"
    }

    measure: avg_unit_productg_sales_amt {
      label: "Avg Unit Product Sales $"
      group_label: "Sales / Cost / Margin"
      type: number
      value_format_name: usd
      sql: ${product_sales_amt} / nullif( ${unit_cnt}, 0 ) ;;
      description: "Product Sales $ / Units"
    }

    measure: avg_unit_product_sales_amt_prev {
      label: "Avg Unit Product Sales $"
      view_label: "1b) % Prev"
      type: percent_of_previous
      value_format: "0.0\%"
      sql: ${avg_unit_productg_sales_amt} ;;
      description: "(Avg Unit Product Sales $ (Current Period) - Avg Unit Product Sales $ (Previous Period)) / Avg Unit Product Sales $ (Current Period)"
    }

    measure: avg_daily_sales {
      label: "Avg Daily Sales $"
      group_label: "Sales / Cost / Margin"
      type: number
      value_format_name: usd
      sql: ${sales_amt} / ${order_date_cnt};;
      description: "Sales $ / Days"
    }

    measure: avg_daily_orders {
      label: "Avg Daily Orders"
      group_label: "Orders / Units / SKUs"
      type: number
      value_format_name: decimal_0
      sql: ${order_cnt} / ${order_date_cnt};;
      description: "Orders / Days"
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
      type: date_hour_of_day
      view_label: "2) Date Ordered"
      group_label: "Time"
      label: "Hour of Day"
      description: "Hour of order."
      sql:${TABLE}.ORDER_dt  ;;
    }

    dimension: order_time_of_day {
      type: date_time_of_day
      view_label: "2) Date Ordered"
      group_label: "Time"
      label: "Time of Day"
      description: "Time of day of order."
      sql:${TABLE}.ORDER_dt  ;;
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

  dimension: bundle_product_shk {
    type: string
    sql: ${TABLE}.BUNDLE_PRODUCT_SHK ;;
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

    dimension: mktg_source_shk {
      type: string
      sql: ${TABLE}.mktg_source_shk ;;
      hidden: yes
    }

    dimension: referring_domain_shk {
      type: string
      sql: ${TABLE}.referring_domain_type_l_shk ;;
      hidden: yes
    }
  }
