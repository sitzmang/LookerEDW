- view: sales_channel_dm_new
  sql_table_name: RPT.MAIN.sales_channel_dm_new
  fields:

#-- pk

  - dimension: sales_channel_shk
    type: string
    sql: ${TABLE}.SALES_CHANNEL_SHK
    hidden: true

#-- dimensions

  - dimension: company_cd
    label: "Company Cd"
    type: string
    sql: ${TABLE}.company_cd
    hidden: true

  - dimension: company_name
    label: "    Company Name"
    type: string
    sql: ${TABLE}.company_name
    drill_fields: [general_mgr_name,sales_channel_rollup_name,sales_channel_name]

  - dimension: general_mgr_cd
    label: "GM Cd"
    type: string
    sql: ${TABLE}.general_mgr_cd
    hidden: true

  - dimension: general_mgr_name
    label: "   GM Name"
    type: string
    sql: ${TABLE}.general_mgr_name
    drill_fields: [sales_channel_rollup_name,sales_channel_name]

  - dimension: sales_channel_rollup_cd
    label: "Sales Channel Rollup Cd"
    type: string
    sql: ${TABLE}.SALES_CHANNEL_ROLLUP_CD
    hidden: true

  - dimension: sales_channel_rollup_name
    label: "  Rollup Name"
    type: string
    sql: ${TABLE}.SALES_CHANNEL_ROLLUP_NAME
    drill_fields: [sales_channel_name]

  - dimension: sales_channel_cd
    label: "Sales Channel Cd"
    type: string
    sql: ${TABLE}.SALES_CHANNEL_CD
    hidden: true

  - dimension: sales_channel_name
    label: " Name"
    type: string
    sql: ${TABLE}.SALES_CHANNEL_NAME
    drill_fields: [product_dm.profit_centre_name]

#-- other

