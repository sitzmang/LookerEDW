view: product_dm {
  sql_table_name: RPT.MAIN.PRODUCT_DM ;;
  #-- pk

  dimension: product_shk {
    type: string
    sql: ${TABLE}.PRODUCT_SHK ;;
    hidden: yes
  }

  #-- dimensions

  dimension: author_cd {
    label: "Author"
    type: string
    sql: ${TABLE}.AUTHOR_CD ;;
    description: "Writer or originator of the content."
    drill_fields: [sku]
  }

  dimension: in_warehouse_unit_cnt {
    label: "Inv:In-Warehouse Units"
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.in_warehouse_unit_cnt ;;
    description: "Total units available to ship."
    hidden: yes
  }

  dimension: reserved_unit_cnt {
    label: "Inv:Reserved Units"
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.reserved_unit_cnt ;;
    description: "Units reserved for open orders."
    hidden: yes
  }

  dimension: available_to_sell_unit_cnt {
    label: "Inv:Avail. to Sell Units"
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.available_to_sell_unit_cnt ;;
    description: "In-warehouse units - reserved units."
  }

  dimension: book_type_cd {
    type: string
    sql: ${TABLE}.book_type_cd ;;
    hidden: yes
  }

  dimension: book_type_name {
    type: string
    sql: ${TABLE}.book_type_name ;;
    hidden: yes
  }

  dimension: physical_product_fl {
    label: "Physical Product"
    type: yesno
    sql: case when ${book_type_cd} in ( '1','4','5' ) then 1 else 0 end = 1 ;;
    description: "Physical product to ship."
  }

  dimension: category_cd {
    type: string
    sql: ${TABLE}.CATEGORY_CD ;;
    hidden: yes
  }

  dimension: category_name {
    label: "Category Name"
    type: string
    sql: ${TABLE}.CATEGORY_NAME ;;
    description: "High level subject matter description for the content."
    drill_fields: [sku]
  }

  dimension: current_product_cost_amt {
    label: "Current Product Cost $"
    type: number
    value_format_name: usd
    sql: ${TABLE}.CURR_PRODUCT_COST_AMT ;;
    description: "Current product cost amount."
  }

  dimension: current_product_cost_amt_tier {
    label: "Current Product Cost $ Tier"
    type: tier
    tiers: [0, 1, 10, 20, 30, 40, 50, 75, 100, 200, 300]
    style: integer
    sql: ${current_product_cost_amt} ;;
    description: "Product cost placement within a hierarchy."
    value_format: "$#,##0"
  }

  dimension: div_subject_cd {
    type: string
    sql: ${TABLE}.DIV_SUBJECT_CD ;;
    hidden: yes
  }

  dimension: div_subject_name {
    label: "Div Subject Name"
    type: string
    sql: ${TABLE}.DIV_SUBJECT_NAME ;;
    description: "Community designation for the content."
    drill_fields: [sku]
  }

  dimension: division_cd {
    label: "Division Cd"
    type: string
    sql: ${TABLE}.DIVISION_CD ;;
    description: "Division code designation for the content."
    drill_fields: [sku]
    hidden: no
  }

  dimension: division_name {
    label: "Division Name"
    type: string
    sql: ${TABLE}.DIVISION_NAME ;;
    description: "Division name designation for the content."
    drill_fields: [sku]
  }

  dimension: edition_type_cd {
    label: "Edition Type Cd"
    type: string
    sql: ${TABLE}.edition_type_cd ;;
    drill_fields: [sku]
    hidden: yes
  }

  dimension: edition_type_name {
    label: "Edition Type Name"
    type: string
    sql: ${TABLE}.edition_type_name ;;
    description: "Identifies the particular form for the content (e.g. hardback, paperback, download, or DVD)."
    drill_fields: [sku]
  }

  dimension: imprint_cd {
    type: string
    sql: ${TABLE}.IMPRINT_CD ;;
    hidden: yes
  }

  dimension: imprint_name {
    label: "Imprint Name"
    type: string
    sql: ${TABLE}.IMPRINT_NAME ;;
    description: "Brand associated with product (printed on spine for books)."
    drill_fields: [sku]
  }

  dimension: magazine_yesno {
    label: "Magazine"
    type: yesno
    sql: ${TABLE}.magazine_bt = '1' ;;
    description: "Products associated with a Magazine Profit Center"
    hidden: yes
  }

  dimension: medium_cd {
    type: string
    sql: ${TABLE}.MEDIUM_CD ;;
    hidden: yes
  }

  dimension: medium_name {
    label: "Medium Name"
    type: string
    sql: ${TABLE}.MEDIUM_NAME ;;
    description: "Generally a subset of Edition Type Name that further defines the form of the content."
    drill_fields: [edition_type_name, sku]
  }

  dimension: product_group_cd {
    type: string
    sql: ${TABLE}.PRODUCT_GROUP_CD ;;
    hidden: yes
  }

  dimension: product_group_name {
    label: "Product Group Name"
    type: string
    sql: ${TABLE}.PRODUCT_GROUP_NAME ;;
    description: "Identifies source of content (in house vs. purchased vs. digital vs. drop ship)."
    drill_fields: [sku]
  }

  dimension: community_name {
    label: "   Community Name"
    group_label: "Community Hierarchy"
    type: string
    sql: ${TABLE}.COMMUNITY_NAME ;;
    drill_fields: [brand_name, profit_centre_name, profit_centre_cd]
  }

  dimension: brand_name {
    label: "  Brand Name"
    group_label: "Community Hierarchy"
    type: string
    sql: ${TABLE}.BRAND_NAME ;;
    drill_fields: [sku, profit_centre_name, profit_centre_cd]
  }

  dimension: profit_centre_cd {
    label: " Profit Center Cd"
    group_label: "Community Hierarchy"
    type: string
    sql: ${TABLE}.PROFIT_CENTRE_CD ;;
    drill_fields: [sku]
    hidden: no
  }

  dimension: profit_centre_name {
    label: " Profit Center Name"
    group_label: "Community Hierarchy"
    type: string
    sql: ${TABLE}.PROFIT_CENTRE_NAME ;;
    drill_fields: [sku]
  }

  dimension_group: intro_dt {
    label: "Published"
    type: time
    timeframes: [day_of_week, date, week, month, month_name, month_num, year]
    sql: ${TABLE}.PUB_DATE ;;
  }

  dimension: src_product_id {
    label: "SBN"
    type: string
    sql: ${TABLE}.SRC_PRODUCT_ID ;;
    hidden: no
  }

  dimension: isbn_10_no {
    label: "ISBN-10"
    type: string
    sql: ${TABLE}.ISBN_10_NO ;;
    description: "International Standard Book Number product identifier."
    hidden: no
  }

  dimension: isbn_13_no {
    label: "ISBN-13"
    type: string
    sql: ${TABLE}.ISBN_13_NO ;;
    description: "International Standard Book Number product identifier (replaces ISBN-10)."
    hidden: no
  }

  dimension: sku {
    label: "SKU"
    type: string
    sql: ${TABLE}.SKU ;;
    description: "Stock Keeping Unit designation for product."
  }

  dimension: product_name {
    label: "SKU Name/Title"
    type: string
    sql: ${TABLE}.PRODUCT_NAME ;;
    description: "Customer facing product name corresponding to SKU designation."
  }

  dimension: sku_weight_no {
    label: "SKU Weight(lbs)"
    type: number
    value_format_name: decimal_3
    sql: ${TABLE}.sku_weight_no ;;
    description: "Actual SKU weight in pounds."
  }

  dimension: sku_weight_no_tier {
    label: "SKU Weight(lbs) Tier"
    type: tier
    tiers: [0, 1, 2, 3, 4, 5, 10, 15, 20, 25, 30, 35]
    style: integer
    sql: ceil( ${sku_weight_no} ) ;;
    description: "SKU weight placement within a hierarchy."
    value_format: "#,##0"
  }

  dimension: subject_1_cd {
    type: string
    sql: ${TABLE}.SUBJECT_1 ;;
    hidden: yes
  }

  dimension: subject_1_name {
    label: "Subject1 Name"
    type: string
    sql: ${TABLE}.SUBJECT_1_NAME ;;
    description: "Detailed subject matter description for the content."
    drill_fields: [sku]
  }

  dimension: general_mgr_name {
    label: "    GM Name"
    group_label: "Community Hierarchy"
    type: string
    sql: ${TABLE}.general_mgr_name ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [product_name, division_name, profit_centre_name, product_group_name, subject_1_name, medium_name, category_name, imprint_name, div_subject_name]
  }
}
