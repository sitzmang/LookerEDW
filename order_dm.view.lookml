- view: order_dm
  sql_table_name: MAIN.ORDER_DM
  fields:

#-- pk

  - dimension: order_shk
    type: string
    sql: ${TABLE}.ORDER_SHK
    hidden: true

#-- dimensions

  - dimension: mage_order_no
    label: 'Web Order No'
    type: string
    sql: ${TABLE}.MAGE_ORDER_NO

  - dimension: order_prefix
    type: string
    sql: ${TABLE}.ORDER_PREFIX
    hidden: true

  - dimension: order_source_cd
    type: string
    sql: ${TABLE}.ORDER_SOURCE_CD

  - dimension: order_source_name
    type: string
    sql: ${TABLE}.ORDER_SOURCE_NAME

  - dimension: src_order_no
    label: 'Order No'
    type: string
    sql: ${TABLE}.SRC_ORDER_NO

