- view: product_dm
  sql_table_name: MAIN.PRODUCT_DM
  fields:

#-- pk

  - dimension: src_product_id
    type: string
    sql: ${TABLE}.SRC_PRODUCT_ID
    hidden: true

  - dimension: product_shk
    type: string
    sql: ${TABLE}.PRODUCT_SHK
    hidden: true

#-- dimensions

  - dimension: author_cd
    label: 'Author'
    type: string
    sql: ${TABLE}.AUTHOR_CD

  - dimension: category_cd
    type: string
    sql: ${TABLE}.CATEGORY_CD
    hidden: true

  - dimension: category_name
    label: 'Category Name'
    type: string
    sql: ${TABLE}.CATEGORY_NAME

  - dimension: div_subject_cd
    type: string
    sql: ${TABLE}.DIV_SUBJECT_CD
    hidden: true

  - dimension: div_subject_name
    label: 'Div Subject Name'
    type: string
    sql: ${TABLE}.DIV_SUBJECT_NAME

  - dimension: division_cd
    label: 'Division Cd'
    type: string
    sql: ${TABLE}.DIVISION_CD
    hidden: false

  - dimension: division_name
    label: 'Division Name'
    type: string
    sql: ${TABLE}.DIVISION_NAME

  - dimension: imprint_cd
    type: string
    sql: ${TABLE}.IMPRINT_CD
    hidden: true

  - dimension: imprint_name
    label: 'Imprint Name'
    type: string
    sql: ${TABLE}.IMPRINT_NAME

  - dimension: medium_cd
    type: string
    sql: ${TABLE}.MEDIUM_CD
    hidden: true

  - dimension: medium_name
    label: 'Medium Name'
    type: string
    sql: ${TABLE}.MEDIUM_NAME

  - dimension: product_group_cd
    type: string
    sql: ${TABLE}.PRODUCT_GROUP_CD
    hidden: true

  - dimension: product_group_name
    label: 'Product Group Name'
    type: string
    sql: ${TABLE}.PRODUCT_GROUP_NAME

  - dimension: profit_centre_cd
    label: 'Profit Center Cd'
    type: string
    sql: ${TABLE}.PROFIT_CENTRE_CD
    hidden: false

  - dimension: profit_centre_name
    label: 'Profit Center Name'
    type: string
    sql: ${TABLE}.PROFIT_CENTRE_NAME

  - dimension: sku
    label: 'SKU'
    type: string
    sql: ${TABLE}.SKU

  - dimension: product_name
    label: 'SKU Name'
    type: string
    sql: ${TABLE}.PRODUCT_NAME

  - dimension: subject_1_cd
    type: string
    sql: ${TABLE}.SUBJECT_1
    hidden: true

  - dimension: subject_1_name
    label: 'Subject1 Name'
    type: string
    sql: ${TABLE}.SUBJECT_1_NAME


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - product_name
    - division_name
    - profit_centre_name
    - product_group_name
    - subject_1_name
    - medium_name
    - category_name
    - imprint_name
    - div_subject_name

