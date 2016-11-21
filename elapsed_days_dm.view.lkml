view: elapsed_day_dm {
  sql_table_name: rpt.main.elapsed_day_dm ;;
  #-- fk

  dimension: elapsed_day_sid {
    type: number
    sql: ${TABLE}.elapsed_day_sid ;;
    hidden: yes
  }

  #-- dimensions

  dimension: elapsed_day_no {
    label: "Elapsed Days"
    type: number
    sql: ${TABLE}.elapsed_day_no ;;
  }

  dimension: elapsed_day_no_tier {
    label: "Elapsed Days Tier"
    type: tier
    tiers: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    style: integer
    sql: ${elapsed_day_no} ;;
    value_format: "00"
    hidden: yes
  }
}
