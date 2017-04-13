view: ddbs_sales_channel_f {
  sql_table_name: rpt.main.DDBS_SALES_CHANNEL_F ;;

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

  dimension: bgt_visit_cnt {
    type: string
    sql: ${TABLE}.bgt_visit_cnt ;;
    hidden: no
  }

  dimension: act_visit_cnt {
    type: string
    sql: ${TABLE}.act_visit_cnt ;;
    hidden: no
  }

  dimension: bgt_aov_amt {
    type: string
    sql: ${TABLE}.bgt_aov_amt ;;
    hidden: no
  }

  dimension: act_aov_amt {
    type: string
    sql: ${TABLE}.act_aov_amt ;;
    hidden: no
  }

  dimension: bgt_order_cnt {
    type: string
    sql: ${TABLE}.bgt_order_cnt ;;
    hidden: no
  }

  dimension: act_order_cnt {
    type: string
    sql: ${TABLE}.act_order_cnt ;;
    hidden: no
  }

}
