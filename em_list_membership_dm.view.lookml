- view: em_list_membership_dm
  sql_table_name: rpt.main.em_list_membership_dm
  fields:

#-- fk

  - dimension: em_list_membership_shk
    type: number
    sql: ${TABLE}.em_list_membership_shk
    hidden: true

  - dimension: src_client_id
    type: number
    sql: ${TABLE}.src_client_id
    hidden: true

  - dimension: src_list_id
    type: number
    sql: ${TABLE}.src_list_id
    hidden: true

  - dimension: src_subscriber_id
    label: 'Subscriber ID'
    type: number
    sql: ${TABLE}.src_subscriber_id
    hidden: true

#-- dimensions

  - dimension: joined_dt
    label: 'Joined'
    type: time
    timeframes: [hour_of_day, day_of_week, date, week, month, year]
    sql: ${TABLE}.join_dt

  - dimension: join_type_cd
    label: 'Join Type Cd'
    type: string
    sql: ${TABLE}.join_type_cd
    
  - dimension: unsubscribed_dt
    label: 'Unsubscribed'
    type: time
    timeframes: [hour_of_day, day_of_week, date, week, month, year]
    sql: ${TABLE}.unsubscribed_dt

  - dimension: unsubscribed_fl
    label: 'Unsubscribed Flag'
    type: string
    sql: ${TABLE}.unsubscribed_fl
    
  - dimension: unsubscribed_yesno
    label: 'Unsubscribed'
    type: yesno
    sql: ${unsubscribed_fl} = 'Y'

  - dimension: unsubscribe_reason
    label: 'Unsubscribed Reason'
    type: string
    sql: ${TABLE}.unsubscribe_reason
