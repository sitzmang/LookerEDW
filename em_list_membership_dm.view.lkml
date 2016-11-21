view: em_list_membership_dm {
  sql_table_name: rpt.main.em_list_membership_dm ;;
  #-- fk

  dimension: em_list_membership_shk {
    type: number
    sql: ${TABLE}.em_list_membership_shk ;;
    hidden: yes
  }

  dimension: src_client_id {
    type: number
    sql: ${TABLE}.src_client_id ;;
    hidden: yes
  }

  dimension: src_list_id {
    type: number
    sql: ${TABLE}.src_list_id ;;
    hidden: yes
  }

  dimension: src_subscriber_id {
    label: "Subscriber ID"
    type: number
    sql: ${TABLE}.src_subscriber_id ;;
    hidden: yes
  }

  #-- dimensions

  dimension_group: joined_dt {
    label: "Joined"
    type: time
    timeframes: [hour_of_day, day_of_week, date, week, month, year]
    sql: ${TABLE}.join_dt ;;
  }

  dimension: join_type_cd {
    label: "Join Type Cd"
    type: string
    sql: ${TABLE}.join_type_cd ;;
  }

  dimension: status {
    label: "Status"
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: unsubscribed_dt {
    label: "Unsubscribed"
    type: time
    timeframes: [hour_of_day, day_of_week, date, week, month, year]
    sql: ${TABLE}.unsubscribed_dt ;;
  }

  dimension: unsubscribed_fl {
    label: "Unsubscribed Flag"
    type: string
    sql: ${TABLE}.unsubscribed_fl ;;
    hidden: yes
  }

  dimension: unsubscribed_yesno {
    label: "Unsubscribed"
    type: yesno
    sql: ${unsubscribed_fl} = 'Y' ;;
  }

  dimension: unsubscribe_reason {
    label: "Unsubscribed Reason"
    type: string
    sql: ${TABLE}.unsubscribe_reason ;;
  }
}
