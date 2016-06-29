- view: sales_channel_dm
  sql_table_name: MAIN.SALES_CHANNEL_DM
  fields:

#-- pk

  - dimension: sales_channel_shk
    type: string
    sql: ${TABLE}.SALES_CHANNEL_SHK
    hidden: true

#-- dimensions

  - dimension: sales_channel_cd
    label: "Sales Channel Cd"
    type: string
    sql: ${TABLE}.SALES_CHANNEL_CD
    hidden: true

  - dimension: sales_channel_name
    label: "Sales Channel Name"
    type: string
    sql: ${TABLE}.SALES_CHANNEL_NAME

#-- other

