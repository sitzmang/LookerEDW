view: ddbs_sales_channel_f {
  sql_table_name: rpt.main.DDBS_SALES_CHANNEL_F ;;

  measure: bgt_visit_cnt {
    label: "Budget Visits"
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.bgt_visit_cnt ;;
    hidden: no
  }

  measure: act_visit_cnt {
    label: "Actual Visits"
    description: "Actual Visit Count"
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.act_visit_cnt;;
  }

## measure: pct_to_budget_visit_cnt {
##    label: "Percent to Budget Visits"
##    description: "Actual visit count / budget visit count"
##    type: number
##    value_format_name: percent_2
##    sql: ${TABLE}.act_visit_cnt / ${TABLE}.bgt_visit_cnt;;
##  }

  measure: bgt_order_cnt {
    label: "Budget Orders"
    type: sum
    sql: ${TABLE}.bgt_order_cnt ;;
    hidden: no
  }

  measure: act_order_cnt {
    label: "Actual Orders"
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.act_order_cnt ;;
    hidden: no
  }

  dimension: bgt_aov_amt {
    label: "Budget AOV"
    type: number
    value_format_name: usd
    sql: ${TABLE}.bgt_aov_amt ;;
    hidden: no
  }

  dimension: act_aov_amt {
    label: "Actual AOV"
    type: number
    value_format_name: usd
    sql: ${TABLE}.act_aov_amt ;;
    hidden: no
  }

  dimension: sales_channel_shk {
    type: string
    sql: ${TABLE}.sales_channel_shk ;;
    hidden: yes
  }

  dimension: date_sid {
    type: number
    sql: ${TABLE}.date_sid ;;
    hidden: yes
  }

}
