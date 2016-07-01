- view: sales_channel_dm
  sql_table_name: MAIN.SALES_CHANNEL_DM
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
    label: "Company Name"
    type: string
    sql: ${TABLE}.company_name

  - dimension: general_mgr_cd
    label: "GM Cd"
    type: string
    sql: ${TABLE}.general_mgr_cd
    hidden: true

  - dimension: general_mgr_name
    label: "GM Name"
    type: string
    sql: ${TABLE}.general_mgr_name

  - dimension: sales_channel_rollup_cd
    label: "Sales Channel Rollup Cd"
    type: string
    sql: ${TABLE}.SALES_CHANNEL_ROLLUP_CD
    hidden: true

  - dimension: sales_channel_rollup_name
    label: "Sales Channel Rollup Name"
    type: string
    sql: ${TABLE}.SALES_CHANNEL_ROLLUP_NAME

  - dimension: sales_channel_cd
    label: "Sales Channel Cd"
    type: string
    sql: ${TABLE}.SALES_CHANNEL_CD
    hidden: false

  - dimension: sales_channel_name
    label: "Sales Channel Name"
    type: string
    sql: ${TABLE}.SALES_CHANNEL_NAME

#-- other

