- view: order_line_f
  sql_table_name: main.gs_order_line_f
  fields:

#-- measures

  - measure: customer_cnt
    label: "Customers"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${TABLE}.SRC_CUSTOMER_NO

  - measure: order_cnt
    label: "Orders"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${TABLE}.SRC_ORDER_NO

  - measure: order_line_cnt
    label: "Order Lines"
    type: count
    value_format_name: decimal_0

  - measure: sku_cnt
    label: "SKUs"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${TABLE}.SRC_PRODUCT_ID

  - measure: product_sales_amt
    label: "Product Sales Amt"
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.PRODUCT_SALES_AMT

  - measure: unit_cnt
    label: "Units"
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.UNIT_CNT

  - measure: avg_order_amt
    label: 'AOV'
    type: number
    value_format_name: usd
    sql: ${product_sales_amt} / nullif( ${order_cnt}, 0 )
    
  - measure: avg_order_unit_cnt
    label: 'AOU'
    type: number
    value_format_name: decimal_1
    sql: ${unit_cnt} / nullif( ${order_cnt}, 0 )
    
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

  - dimension: order_date_sid
    type: number
    sql: ${TABLE}.ORDER_DATE_SID
    hidden: true

  - dimension: ship_date_sid
    type: number
    sql: ${TABLE}.SHIP_DATE_SID
    hidden: true

  - dimension: sales_channel_cd
    type: string
    sql: ${TABLE}.SALES_CHANNEL_CD
    hidden: true

  - dimension: src_product_id
    type: string
    sql: ${TABLE}.SRC_PRODUCT_ID
    hidden: true

  - dimension: order_line_status_cd
    type: string
    sql: ${TABLE}.order_line_status_cd
    hidden: true

#-- other

  - dimension: order_dt
    type: time
    convert_tz: false
    sql: ${TABLE}.ORDER_DT
    hidden: true

  - dimension: src_customer_no
    type: string
    sql: ${TABLE}.SRC_CUSTOMER_NO
    hidden: true

  - dimension: src_order_no
    type: string
    sql: ${TABLE}.SRC_ORDER_NO
    hidden: true


