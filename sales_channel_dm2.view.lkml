view: sales_channel_dm2 {
  sql_table_name: RPT.MAIN.SALES_CHANNEL_DM2 ;;
  #-- pk

  dimension: sales_channel_shk {
    type: string
    sql: ${TABLE}.SALES_CHANNEL_SHK ;;
    hidden: yes
  }

  #-- dimensions

  dimension: company_cd {
    label: "Company Cd"
    type: string
    sql: ${TABLE}.company_cd ;;
    hidden: yes
  }

  dimension: company_name {
    label: "    Company Name"
    type: string
    sql: ${TABLE}.company_name ;;
    drill_fields: [general_mgr_name, sales_channel_rollup_name, sales_channel_name]
  }

  dimension: general_mgr_cd {
    label: "GM Cd"
    type: string
    sql: ${TABLE}.general_mgr_cd ;;
    hidden: yes
  }

  dimension: general_mgr_name {
    label: "   GM Name"
    type: string
    sql: ${TABLE}.general_mgr_name ;;
    drill_fields: [sales_channel_rollup_name, sales_channel_name]
  }

  dimension: sales_channel_rollup_cd {
    label: "Sales Channel Rollup Cd"
    type: string
    sql: ${TABLE}.SALES_CHANNEL_ROLLUP_CD ;;
    hidden: yes
  }

  dimension: sales_channel_rollup_name {
    label: "  Sales Channel Rollup Name"
    type: string
    sql: ${TABLE}.SALES_CHANNEL_ROLLUP_NAME ;;
    drill_fields: [sales_channel_name]
  }

  dimension: sales_channel_cd {
    label: "Sales Channel Cd"
    type: string
    sql: ${TABLE}.SALES_CHANNEL_CD ;;
    hidden: yes
  }

  dimension: sales_channel_name {
    label: " Sales Channel Name"
    type: string
    sql: ${TABLE}.SALES_CHANNEL_NAME ;;
    drill_fields: [product_dm.profit_centre_name]
  }
}

#-- other
