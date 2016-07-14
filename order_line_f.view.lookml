- view: order_line_f
  sql_table_name: MAIN.GS2_ORDER_LINE_F
  fields:

#-- measures

  - measure: customer_cnt
    label: 'Customers'
    description: 'Unique count of customers.'
    type: count_distinct
    value_format_name: decimal_0
    sql: ${TABLE}.customer_shk
    description: 'Distinct Customer Count'

  - measure: customer_cnt_prev
    label: 'Customers'
    view_label: '1b) % Prev'
    type: percent_of_previous
    value_format: '0.0\%'
    sql: ${customer_cnt}

  - measure: customer_cnt_pttl
    label: 'Customers'
    view_label: '1c) % Total'
    type: percent_of_total
    value_format: '0.0\%'
    sql: ${customer_cnt}
  
  - measure: order_cnt
    label: 'Orders'
    description: 'Unique count of orders.'
    type: count_distinct
    value_format_name: decimal_0
    sql: ${TABLE}.order_shk
    description: 'Distinct Order Count'

  - measure: order_line_cnt
    label: 'Order Lines'
    type: count
    value_format_name: decimal_0

  - measure: sku_cnt
    label: 'SKUs'
    description: 'Unique count of SKUs.'
    type: count_distinct
    value_format_name: decimal_0
    sql: ${TABLE}.product_shk
    description: 'Distinct SKU Count'

  - measure: product_sales_amt
    label: 'Product Sales Amt'
    type: sum
    value_format_name: usd
    sql: ${TABLE}.PRODUCT_SALES_AMT

  - measure: product_sales_amt_prev
    label: 'Product Sales Amt'
    view_label: '1b) % Prev'
    type: percent_of_previous
    value_format: '0.0\%'
    sql: ${product_sales_amt}

  - measure: product_sales_amt_pttl
    label: 'Product Sales Amt'
    view_label: '1c) % Total'
    type: percent_of_total
    value_format: '0.0\%'
    sql: ${product_sales_amt}
  
  - measure: shipping_sales_amt
    label: 'Shipping Sales Amt'
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.SHIPPING_SALES_AMT

  - measure: shipping_sales_amt_prev
    label: 'Shipping Sales Amt'
    view_label: '1b) % Prev'
    type: percent_of_previous
    value_format: '0.0\%'
    sql: ${shipping_sales_amt}

  - measure: shipping_sales_amt_pttl
    label: 'Shipping Sales Amt'
    view_label: '1c) % Total'
    type: percent_of_total
    value_format: '0.0\%'
    sql: ${shipping_sales_amt}
  
  - measure: sales_amt
    label: 'Sales Amt'
    type: sum
    value_format_name: usd
    sql: ${TABLE}.SALES_AMT
    description: 'Product Sales + Shipping Sales'

  - measure: sales_amt_prev
    label: 'Sales Amt'
    view_label: '1b) % Prev'
    type: percent_of_previous
    value_format: '0.0\%'
    sql: ${sales_amt}

  - measure: sales_amt_pttl
    label: 'Sales Amt'
    view_label: '1c) % Total'
    type: percent_of_total
    value_format: '0.0\%'
    sql: ${sales_amt}
  
  - measure: sales_tax_amt
    label: 'Sales Tax Amt'
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.sales_tax_amt

  - measure: unit_cnt
    label: 'Units'
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.UNIT_CNT

  - measure: avg_order_amt
    label: 'AOV Product $'
    type: number
    value_format_name: usd
    sql: ${product_sales_amt} / nullif( ${order_cnt}, 0 )
    description: 'Avg Order Product $'
    
  - measure: avg_order_unit_cnt
    label: 'AOU'
    type: number
    value_format_name: decimal_1
    sql: ${unit_cnt} / nullif( ${order_cnt}, 0 )
    description: 'Avg Order Units'
    
  - measure: avg_customer_amt
    label: 'Avg Customer Product $'
    type: number
    value_format_name: usd
    sql: ${product_sales_amt} / nullif( ${customer_cnt}, 0 )
    
  - measure: avg_customer_unit_cnt
    label: 'Avg Customer Units'
    type: number
    value_format_name: decimal_1
    sql: ${unit_cnt} / nullif( ${customer_cnt}, 0 )
    
  - measure: avg_sku_amt
    label: 'Avg SKU Product $'
    type: number
    value_format_name: usd
    sql: ${product_sales_amt} / nullif( ${sku_cnt}, 0 )
    
  - measure: avg_sku_unit_cnt
    label: 'Avg SKU Units'
    type: number
    value_format_name: decimal_1
    sql: ${unit_cnt} / nullif( ${sku_cnt}, 0 )
    
  - measure: avg_unit_amt
    label: 'Avg Unit Product $'
    type: number
    value_format_name: usd
    sql: ${product_sales_amt} / nullif( ${unit_cnt}, 0 )
    
#-- other

  - dimension: billing_state_shk
    type: string
    sql: ${TABLE}.BILLING_STATE_SHK
    hidden: true

  - dimension: customer_shk
    type: string
    sql: ${TABLE}.CUSTOMER_SHK
    hidden: true

  - dimension: dlr_off_discount_amt
    type: string
    sql: ${TABLE}.DLR_OFF_DISCOUNT_AMT
    hidden: true

  - dimension: order_date_sid
    type: string
    sql: ${TABLE}.ORDER_DATE_SID
    hidden: true

  - dimension: order_line_status_shk
    type: string
    sql: ${TABLE}.ORDER_LINE_STATUS_SHK
    hidden: true

  - dimension: order_shk
    type: string
    sql: ${TABLE}.ORDER_SHK
    hidden: true

  - dimension: pct_off_discount_amt
    type: string
    sql: ${TABLE}.PCT_OFF_DISCOUNT_AMT
    hidden: true

  - dimension: product_cost_amt
    type: string
    sql: ${TABLE}.PRODUCT_COST_AMT
    hidden: true

  - dimension: product_margin_amt
    type: string
    sql: ${TABLE}.PRODUCT_MARGIN_AMT
    hidden: true

  - dimension: product_shk
    type: string
    sql: ${TABLE}.PRODUCT_SHK
    hidden: true

  - dimension: sales_channel_shk
    type: string
    sql: ${TABLE}.SALES_CHANNEL_SHK
    hidden: true

  - dimension: ship_date_sid
    type: string
    sql: ${TABLE}.SHIP_DATE_SID
    hidden: true

  - dimension: system_sid
    type: string
    sql: ${TABLE}.SYSTEM_SID
    hidden: true
