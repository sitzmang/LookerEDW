view: em_subscriber_dm {
  sql_table_name: rpt.main.em_subscriber_dm ;;
  #-- fk

  dimension: em_subscriber_shk {
    type: number
    sql: ${TABLE}.em_subscriber_shk ;;
    hidden: yes
  }

  dimension: em_bu_shk {
    type: number
    sql: ${TABLE}.em_bu_shk ;;
    hidden: yes
  }

  dimension: src_client_id {
    type: number
    sql: ${TABLE}.src_client_id ;;
    hidden: yes
  }

  dimension: src_subscriber_id {
    label: "Subscriber ID"
    type: number
    sql: ${TABLE}.src_subscriber_id ;;
    hidden: yes
  }

  #-- dimensions

  dimension: email_adrs {
    label: "Email Adrs"
    type: string
    sql: ${TABLE}.email_adrs ;;
  }

  dimension: email_domain {
    label: "Email Domain"
    type: string
    sql: ${TABLE}.email_domain ;;
  }

  dimension: subscriber_key {
    label: "Subscriber Key"
    type: string
    sql: ${TABLE}.email_adrs ;;
    hidden: yes
  }

  dimension: status {
    label: "Status"
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: created_dt {
    label: "Created"
    type: time
    timeframes: [hour_of_day, day_of_week, date, week, month, year]
    sql: ${TABLE}.created_dt ;;
  }

  dimension_group: held_dt {
    label: "Held"
    type: time
    timeframes: [hour_of_day, day_of_week, date, week, month, year]
    sql: ${TABLE}.held_dt ;;
  }

  dimension_group: unsubscribed_dt {
    label: "Unsubscribed"
    type: time
    timeframes: [hour_of_day, day_of_week, date, week, month, year]
    sql: ${TABLE}.unsubscribed_dt ;;
  }
}
