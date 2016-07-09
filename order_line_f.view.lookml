- view: order_line_f
  sql_table_name: MAIN.GS2_ORDER_LINE_F
  fields:

#-- measures

  - measure: customer_cnt
    label: 'Customers'
    type: count_distinct
    value_format_name: decimal_0
    sql: ${TABLE}.customer_shk
    description: 'Distinct Customer Count'

  - measure: order_cnt
    label: 'Orders'
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
    type: count_distinct
    value_format_name: decimal_0
    sql: ${TABLE}.product_shk
    description: 'Distinct SKU Count'

  - measure: product_sales_amt
    label: 'Product Sales Amt'
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.PRODUCT_SALES_AMT

  - measure: shipping_sales_amt
    label: 'Shipping Sales Amt'
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.SHIPPING_SALES_AMT

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
    label: 'AOV'
    type: number
    value_format_name: usd
    sql: ${product_sales_amt} / nullif( ${order_cnt}, 0 )
    description: 'Avg Order Value'
    
  - measure: avg_order_unit_cnt
    label: 'AOU'
    type: number
    value_format_name: decimal_1
    sql: ${unit_cnt} / nullif( ${order_cnt}, 0 )
    description: 'Avg Order Units'
    
  - measure: avg_customer_amt
    label: 'Avg Customer $'
    type: number
    value_format_name: usd
    sql: ${product_sales_amt} / nullif( ${customer_cnt}, 0 )
    
  - measure: avg_customer_unit_cnt
    label: 'Avg Customer Units'
    type: number
    value_format_name: decimal_1
    sql: ${unit_cnt} / nullif( ${customer_cnt}, 0 )
    
  - measure: avg_sku_amt
    label: 'Avg SKU $'
    type: number
    value_format_name: usd
    sql: ${product_sales_amt} / nullif( ${sku_cnt}, 0 )
    
  - measure: avg_sku_unit_cnt
    label: 'Avg SKU Units'
    type: number
    value_format_name: decimal_1
    sql: ${unit_cnt} / nullif( ${sku_cnt}, 0 )
    
  - measure: avg_unit_amt
    label: 'Avg Unit $'
    type: number
    value_format_name: usd
    sql: ${product_sales_amt} / nullif( ${unit_cnt}, 0 )
    
#-- fk

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

  - dimension: sales_amt
    type: string
    sql: ${TABLE}.SALES_AMT
    hidden: true

  - dimension: sales_channel_shk
    type: string
    sql: ${TABLE}.SALES_CHANNEL_SHK
    hidden: true

  - dimension: ship_date_sid
    type: string
    sql: ${TABLE}.SHIP_DATE_SID
    hidden: true
