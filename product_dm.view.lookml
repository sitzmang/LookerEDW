- view: product_dm
  sql_table_name: MAIN.PRODUCT_DM
  fields:

#-- pk

  - dimension: product_shk
    type: string
    sql: ${TABLE}.PRODUCT_SHK
    hidden: true

#-- dimensions

  - dimension: author_cd
    label: 'Author'
    type: string
    sql: ${TABLE}.AUTHOR_CD
    drill_fields: [sku]

  - dimension: category_cd
    type: string
    sql: ${TABLE}.CATEGORY_CD
    hidden: true

  - dimension: category_name
    label: 'Category Name'
    type: string
    sql: ${TABLE}.CATEGORY_NAME
    drill_fields: [sku]

  - dimension: div_subject_cd
    type: string
    sql: ${TABLE}.DIV_SUBJECT_CD
    hidden: true

  - dimension: div_subject_name
    label: 'Div Subject Name'
    type: string
    sql: ${TABLE}.DIV_SUBJECT_NAME
    drill_fields: [sku]

  - dimension: division_cd
    label: 'Division Cd'
    type: string
    sql: ${TABLE}.DIVISION_CD
    drill_fields: [sku]
    hidden: false

  - dimension: division_name
    label: 'Division Name'
    type: string
    sql: ${TABLE}.DIVISION_NAME
    drill_fields: [sku]

  - dimension: imprint_cd
    type: string
    sql: ${TABLE}.IMPRINT_CD
    hidden: true

  - dimension: imprint_name
    label: 'Imprint Name'
    type: string
    sql: ${TABLE}.IMPRINT_NAME
    drill_fields: [sku]

  - dimension: medium_cd
    type: string
    sql: ${TABLE}.MEDIUM_CD
    hidden: true

  - dimension: medium_name
    label: 'Medium Name'
    type: string
    sql: ${TABLE}.MEDIUM_NAME
    drill_fields: [sku]

  - dimension: product_group_cd
    type: string
    sql: ${TABLE}.PRODUCT_GROUP_CD
    hidden: true

  - dimension: product_group_name
    label: 'Product Group Name'
    type: string
    sql: ${TABLE}.PRODUCT_GROUP_NAME
    drill_fields: [sku]

  - dimension: community_name
    label: '   Community Name'
    group_label: 'Community Hierarchy'
    type: string
    sql: ${TABLE}.COMMUNITY_NAME
    drill_fields: [brand_name, profit_centre_name, profit_centre_cd]

  - dimension: brand_name
    label: '  Brand Name'
    group_label: 'Community Hierarchy'
    type: string
    sql: ${TABLE}.BRAND_NAME
    drill_fields: [sku,profit_centre_name, profit_centre_cd]

  - dimension: profit_centre_cd
    label: ' Profit Center Cd'
    group_label: 'Community Hierarchy'
    type: string
    sql: ${TABLE}.PROFIT_CENTRE_CD
    drill_fields: [sku]
    hidden: false

  - dimension: profit_centre_name
    label: ' Profit Center Name'
    group_label: 'Community Hierarchy'
    type: string
    sql: ${TABLE}.PROFIT_CENTRE_NAME
    drill_fields: [sku]

  - dimension: src_product_id
    label: 'SBN'
    type: string
    sql: ${TABLE}.SRC_PRODUCT_ID
    hidden: false

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
    drill_fields: [sku]


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

