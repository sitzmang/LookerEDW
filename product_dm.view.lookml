- view: product_dm
  sql_table_name: MAIN.PRODUCT_DM
  fields:

#-- pk

  - dimension: product_shk
    type: string
    sql: ${TABLE}.PRODUCT_SHK
    hidden: true

  - dimension: src_product_id
    type: string
    sql: ${TABLE}.SRC_PRODUCT_ID
    hidden: true

#-- other

  - dimension: description
    label: "Description"
    type: string
    sql: ${TABLE}.DESCRIPTION

  - dimension: gl_account
    label: "GL Account"
    type: string
    sql: ${TABLE}.GL_ACCOUNT

  - dimension: profit_center_cd
    label: "Profit Center Cd"
    type: string
    sql: ${TABLE}.PROFIT_CENTER_CD

  - dimension: profit_center_dscr
    label: "Profit Center Name"
    type: string
    sql: ${TABLE}.PROFIT_CENTER_DSCR

  - dimension: sku
    label: "SKU"
    type: string
    sql: ${TABLE}.SKU

#-- other


