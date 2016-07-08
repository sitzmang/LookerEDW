- view: customer_dm
  sql_table_name: MAIN.CUSTOMER_DM
  fields:

#-- fk

  - dimension: customer_shk
    type: string
    sql: ${TABLE}.CUSTOMER_SHK
    hidden: true

#-- dimensions

  - dimension: customer_prefix
    type: string
    sql: ${TABLE}.CUSTOMER_PREFIX
    hidden: true

  - dimension: email_adrs
    label: 'E-mail Address'
    type: string
    sql: ${TABLE}.EMAIL_ADRS

  - dimension: email_domain
    label: 'E-mail Domain'
    type: string
    sql: ${TABLE}.EMAIL_DOMAIN

  - dimension: src_customer_no
    label: 'Customer No'
    type: string
    sql: ${TABLE}.SRC_CUSTOMER_NO

  - dimension: trade_bt
    type: string
    sql: ${TABLE}.TRADE_BT
    hidden: true

  - dimension: consumer_bt
    type: string
    sql: ${TABLE}.CONSUMER_BT
    hidden: true
