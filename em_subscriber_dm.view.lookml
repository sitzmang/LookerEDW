- view: em_subscriber_dm
  sql_table_name: rpt.main.em_subscriber_dm
  fields:

#-- fk

  - dimension: em_subscriber_shk
    type: number
    sql: ${TABLE}.em_subscriber_shk
    hidden: true

  - dimension: src_client_id
    type: number
    sql: ${TABLE}.src_client_id
    hidden: true

  - dimension: src_subscriber_id
    label: 'Subscriber ID'
    type: number
    sql: ${TABLE}.src_subscriber_id
    hidden: true

#-- dimensions

  - dimension: email_adrs
    label: 'Email Adrs'
    type: string
    sql: ${TABLE}.email_adrs
    
  - dimension: email_domain
    label: 'Email Domain'
    type: string
    sql: ${TABLE}.email_domain

  - dimension: subscriber_key
    label: 'Subscriber Key'
    type: string
    sql: ${TABLE}.email_adrs
    hidden: true
    
  - dimension: status
    label: 'Subscriber Status'
    type: string
    sql: ${TABLE}.status
    
  - dimension: created_dt
    label: 'Created'
    type: time
    timeframes: [hour_of_day, day_of_week, date, week, month, year]
    sql: ${TABLE}.created_dt

  - dimension: held_dt
    label: 'Held'
    type: time
    timeframes: [hour_of_day, day_of_week, date, week, month, year]
    sql: ${TABLE}.held_dt

  - dimension: unsubscribed_dt
    label: 'Unsubscribed'
    type: time
    timeframes: [hour_of_day, day_of_week, date, week, month, year]
    sql: ${TABLE}.unsubscribed_dt
