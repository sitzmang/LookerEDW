- view: et_subscribers
  sql_table_name: exacttarget.main.et_subscribers
  fields:

#-- fk

  - dimension: client_id
    type: number
    sql: ${TABLE}.client_id
    hidden: true

  - dimension: subscriber_id
    label: 'Subscriber ID'
    type: number
    sql: ${TABLE}.subscriber_id
    hidden: false

#-- dimensions

  - dimension: email_adrs
    label: 'Email Adrs'
    type: string
    sql: ${TABLE}.email_adrs
    
  - dimension: email_domain
    label: 'Email Domain'
    type: string
    sql: regexp_substr( lower( ${TABLE}.email_adrs ), '@[^.]*' )

  - dimension: subscriber_key
    label: 'Subscriber Key'
    type: string
    sql: ${TABLE}.email_adrs
    
  - dimension: status
    label: 'Subscriber Status'
    type: string
    sql: lower( case when lower( ${TABLE}.status ) = 'unsub' then 'unsubscribed' else ${TABLE}.status end )
    
  - dimension: date_created
    label: 'Created'
    type: time
    timeframes: [hour_of_day, day_of_week, date, week, month, year]
    sql: ${TABLE}.date_created

  - dimension: date_held
    label: 'Held'
    type: time
    timeframes: [hour_of_day, day_of_week, date, week, month, year]
    sql: ${TABLE}.date_held

  - dimension: date_unsubscribed
    label: 'Unsubscribed'
    type: time
    timeframes: [hour_of_day, day_of_week, date, week, month, year]
    sql: ${TABLE}.date_unsubscribed
