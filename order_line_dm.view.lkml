view: order_line_dm {
  sql_table_name: RPT.MAIN.ORDER_LINE_DM ;;
  #-- pk

  dimension: order_line_shk {
    type: string
    sql: ${TABLE}.order_line_shk ;;
    hidden: yes
  }

  #-- dimensions

  dimension: gl_division_no {
    label: "GL Division No"
    type: string
    sql: ${TABLE}.gl_division_no ;;
  }

  dimension: gl_division_name {
    label: "GL Division Name"
    type: string
    sql: ${TABLE}.gl_division_name ;;
  }

  dimension: gl_subdivision_no {
    label: "GL Subdivision No"
    type: string
    sql: ${TABLE}.gl_subdivision_no ;;
  }

  dimension: gl_subdivision_name {
    label: "GL Subdivision Name"
    type: string
    sql: ${TABLE}.gl_subdivision_name ;;
  }

  dimension: gl_revenue_account_no {
    label: "GL Revenue Account No"
    type: string
    sql: ${TABLE}.gl_revenue_account_no ;;
  }

  dimension: gl_revenue_account_name {
    label: "GL Revenue Account Name"
    type: string
    sql: ${TABLE}.gl_revenue_account_name ;;
  }
}
