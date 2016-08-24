- view: product_dm
  sql_table_name: RPT.MAIN.PRODUCT_DM
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

  - dimension: in_warehouse_unit_cnt
    label: 'Inv:In-Warehouse Units'
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.in_warehouse_unit_cnt
    description: 'Total Units Available to Ship'
    hidden: true

  - dimension: reserved_unit_cnt
    label: 'Inv:Reserved Units'
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.reserved_unit_cnt
    description: 'Units Reserved for Open Orders'
    hidden: true

  - dimension: available_to_sell_unit_cnt
    label: 'Inv:Avail. to Sell Units'
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.available_to_sell_unit_cnt
    description: 'In-warehouse Units - Reserved Units'

  - dimension: book_type_cd
    type: string
    sql: ${TABLE}.book_type_cd
    hidden: true

  - dimension: book_type_name
    type: string
    sql: ${TABLE}.book_type_name
    hidden: true

  - dimension: physical_product_fl
    label: 'Physical Product'
    type: yesno
    sql: case when ${book_type_cd} in ( '1','4','5' ) then 1 else 0 end = 1
    description: 'Physical Product to Ship'

  - dimension: category_cd
    type: string
    sql: ${TABLE}.CATEGORY_CD
    hidden: true

  - dimension: category_name
    label: 'Category Name'
    type: string
    sql: ${TABLE}.CATEGORY_NAME
    drill_fields: [sku]

  - dimension: current_product_cost_amt
    label: 'Current Product Cost $'
    type: number
    value_format_name: usd
    sql: ${TABLE}.CURR_PRODUCT_COST_AMT
    description: 'Current Product Cost Amount.'

  - dimension: current_product_cost_amt_tier
    label: 'Current Product Cost $ Tier'
    type: tier
    tiers: [0,1,10,20,30,40,50,75,100,200,300]
    style: integer
    sql: ${current_product_cost_amt}
    value_format: '$#,##0'

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

  - dimension: edition_type_cd
    label: 'Edition Type Cd'
    type: string
    sql: ${TABLE}.edition_type_cd
    drill_fields: [sku]
    hidden: true

  - dimension: edition_type_name
    label: 'Edition Type Name'
    type: string
    sql: ${TABLE}.edition_type_name
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
    drill_fields: [edition_type_name, sku]

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

  - dimension: intro_dt
    label: 'Published'
    type: time
    timeframes: [day_of_week, date, week, month, month_name, month_num, year]
    sql: ${TABLE}.PUB_DATE

  - dimension: src_product_id
    label: 'SBN'
    type: string
    sql: ${TABLE}.SRC_PRODUCT_ID
    hidden: false

  - dimension: isbn_10_no
    label: 'ISBN-10'
    type: string
    sql: ${TABLE}.ISBN_10_NO
    hidden: false

  - dimension: isbn_13_no
    label: 'ISBN-13'
    type: string
    sql: ${TABLE}.ISBN_13_NO
    hidden: false

  - dimension: sku
    label: 'SKU'
    type: string
    sql: ${TABLE}.SKU

  - dimension: product_name
    label: 'SKU Name/Title'
    type: string
    sql: ${TABLE}.PRODUCT_NAME

  - dimension: sku_weight_no
    label: 'SKU Weight(lbs)'
    type: number
    value_format_name: decimal_3
    sql: ${TABLE}.sku_weight_no
    description: 'Actual SKU Weight in Pounds'

  - dimension: sku_weight_no_tier
    label: 'SKU Weight(lbs) Tier'
    type: tier
    tiers: [0,1,2,3,4,5,10,15,20,25,30,35]
    style: integer
    sql: ceil( ${sku_weight_no} )
    value_format: '#,##0'

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

