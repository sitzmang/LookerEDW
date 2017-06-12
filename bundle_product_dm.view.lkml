view: bundle_product_dm {
  sql_table_name: RPT.MAIN.BUNDLE_PRODUCT_DM ;;
    #-- pk

    dimension: product_shk {
      type: string
      sql: ${TABLE}.PRODUCT_SHK ;;
      hidden: yes
    }

    #-- dimensions

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

    # ----- Sets of fields for drilling ------
    set: detail {
      fields: [product_name]
    }
  }
