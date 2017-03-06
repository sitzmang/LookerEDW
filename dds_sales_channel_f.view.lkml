view: dds_sales_channel_f {
  sql_table_name: rpt.main.dds_sales_channel_f ;;


  measure: avg_visit_minutes {
    label: "Avg Visit Minutes"
    group_label:"Visits"
    description: "Avg Minutes on Site  / Visit"
    type: number
    value_format_name: decimal_1
    sql: ${timespent_second_cnt} / 60 / NULLIF(${timespent_visit_cnt},0) ;;
  }

  measure: email_signup_cnt {
    label: "Email Signups"
    group_label:"Visits"
    description: "Email Signup Count"
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.email_signup_cnt;;
  }

  measure: timespent_second_cnt {
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.timespent_second_cnt;;
    hidden: yes
  }

  measure: timespent_visit_cnt {
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.timespent_visit_cnt;;
    hidden: yes
  }

  measure: avg_visit_page_views {
    label: "Avg Visit Page Views"
    group_label:"Visits"
    description: "Page Views / Visits"
    type: number
    value_format_name: decimal_2
    sql: ${page_cnt} / NULLIF(${visit_cnt},0) ;;
  }

  measure: avg_store_visit_page_views {
    label: "Avg Store Visit Page Views"
    group_label:"Visits"
    description: "Store Page Views / Store Visits"
    type: number
    value_format_name: decimal_2
    sql: ${store_page_cnt} / NULLIF(${store_visit_cnt},0) ;;
  }

  measure: order_conversion_rate {
    label: "Site Conversion"
    group_label:"Visits"
    description: "Orders / Visits"
    type: number
    value_format_name: percent_2
    sql: cast( ${visit_order_cnt} as float)/NULLIF(${visit_cnt},0) ;;
  }

  measure: order_conversion_rate_prev {
    label: "Site Conversion"
    view_label: "1b) % Prev"
    type: percent_of_previous
    value_format: "0.0\%"
    sql: ${order_conversion_rate} ;;
  }

  measure: store_conversion_rate {
    label: "Store Conversion"
    group_label:"Visits"
    description: "Orders / Store Visits"
    type: number
    value_format_name: percent_2
    sql: cast( ${visit_order_cnt} as float)/NULLIF(${store_visit_cnt},0) ;;
  }

  measure: store_conversion_rate_prev {
    label: "Store Conversion"
    view_label: "1b) % Prev"
    type: percent_of_previous
    value_format: "0.0\%"
    sql: ${store_conversion_rate} ;;
  }

  measure: order_cnt {
    label: "Orders"
    group_label:"Sales"
    description: "Order Count"
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.order_cnt;;
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

  measure: visit_order_cnt {
    hidden: yes
    type: sum
    value_format_name: decimal_0
    sql: ${visit_order_bt} * ${TABLE}.order_cnt;;
  }

  measure: page_cnt {
    label: "Page Views"
    group_label:"Visits"
    description: "Count of page views."
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.page_cnt ;;
  }

  measure: store_page_cnt {
    label: "Store Page Views"
    group_label:"Visits"
    description: "Count of store page views."
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.store_page_cnt ;;
  }

  measure: visit_cnt {
    label: "Visits"
    group_label:"Visits"
    description: "Visit Count"
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.visit_cnt;;
  }

  measure: visit_cnt_prev {
    label: "Visits"
    view_label: "1b) % Prev"
    type: percent_of_previous
    value_format: "0.0\%"
    sql: ${visit_cnt} ;;
  }

  measure: visit_cnt_pttl {
    label: "Visits"
    view_label: "1c) % Total"
    type: percent_of_total
    value_format: "0.0\%"
    sql: ${visit_cnt} ;;
  }

  measure: bounce_cnt {
    label: "Visit Bounces"
    group_label:"Visits"
    description: "Bounce Count"
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.bounce_visit_cnt;;
  }

  measure: visit_bounce_rate {
    label: "Visit Bounce Rate"
    group_label:"Visits"
    description: "Visits with Bounce / Visits"
    type: number
    value_format_name: percent_1
    sql: cast( ${bounce_cnt} as float)/NULLIF(${visit_cnt},0) ;;
  }

  dimension: visit_order_bt {
    type: number
    sql: ${TABLE}.visit_order_bt ;;
    description: "Identifies if orders can be aggregated for the purpose of calculating CVR."
    hidden: yes
  }

  measure: product_cost_amt {
    label: "Product Cost $"
    group_label:"Sales"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.PRODUCT_COST_AMT ;;
    description: "Product Cost Amount."
  }

  measure: product_margin_amt {
    label: "Product Margin $"
    group_label:"Sales"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.PRODUCT_MARGIN_AMT ;;
    description: "Product Margin Amount."
  }

  measure: product_margin_pct {
    label: "Product Margin %"
    group_label:"Sales"
    type: number
    value_format_name: percent_1
    sql: ${product_margin_amt} / nullif( ${product_sales_amt}, 0 ) ;;
    description: "Product Margin / Product Sales."
  }

  measure: product_sales_amt {
    label: "Product Sales $"
    group_label:"Sales"
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
    group_label:"Sales"
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
    group_label:"Sales"
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

  measure: store_visit_cnt {
    label: "Store Visits"
    group_label:"Visits"
    description: "Store Visit Count"
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.store_visit_cnt;;
    hidden: no
  }

  measure: store_visit_rate {
    label: "Store Visit Rate"
    group_label:"Visits"
    description: "Store Visit Count / Visits"
    type: number
    value_format_name: percent_1
    sql: cast( ${store_visit_cnt} as float)/NULLIF(${visit_cnt},0) ;;
    hidden: no
  }

  measure: unit_cnt {
    label: "Units"
    group_label:"Sales"
    type: sum
    value_format_name: decimal_2
    sql: ${TABLE}.UNIT_CNT ;;
  }

  measure: avg_order_product_sales_amt {
    label: "AOV Product Sales $"
    group_label:"Sales"
    type: number
    value_format_name: usd
    sql: ${product_sales_amt} / nullif( ${order_cnt}, 0 ) ;;
    description: "Product Sales / Orders"
  }

  measure: avg_order_sales_amt {
    label: "AOV Sales $"
    group_label:"Sales"
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
    group_label:"Sales"
    type: number
    value_format_name: decimal_1
    sql: ${unit_cnt} / nullif( ${order_cnt}, 0 ) ;;
    description: "Units / Orders"
  }

  measure: avg_unit_product_cost_amt {
    label: "Avg Unit Product Cost $"
    group_label:"Sales"
    type: number
    value_format_name: usd
    sql: ${product_cost_amt} / nullif( ${unit_cnt}, 0 ) ;;
    description: "Product Cost / Units"
  }

  measure: avg_unit_product_margin_amt {
    label: "Avg Unit Product Margin $"
    group_label:"Sales"
    type: number
    value_format_name: usd
    sql: ${product_margin_amt} / nullif( ${unit_cnt}, 0 ) ;;
    description: "Product Margin / Units"
  }

  measure: avg_unit_productg_sales_amt {
    label: "Avg Unit Product Sales $"
    group_label:"Sales"
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

  measure: date_cnt {
    label: "Date:Days"
    group_label:"Sales"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${TABLE}.request_date_sid ;;
    description: "Distinct Date Count"
  }

  measure: avg_daily_sales_to_date {
    label: "Avg Daily Sales"
    group_label:"Sales"
    type: number
    value_format_name: usd
    sql: ${sales_amt} / ${date_cnt};;
    description: "Sales / Date:Days"
  }

  measure: avg_daily_orders_to_date {
    label: "Avg Daily Orders"
    group_label:"Sales"
    type: number
    value_format_name: decimal_0
    sql: ${order_cnt} / ${date_cnt};;
    description: "Orders / Date:Days"
  }

  measure: avg_daily_visits_to_date {
    label: "Avg Daily Visits"
    group_label:"Visits"
    type: number
    value_format_name: decimal_0
    sql: ${visit_cnt} / ${date_cnt};;
    description: "Visits / Date:Days"
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
