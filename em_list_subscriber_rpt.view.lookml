- view: em_list_subscriber_rpt
  sql_table_name: rpt.main.em_list_subscriber_rpt
  fields:

#-- fk

  - dimension: client_id
    type: number
    sql: ${TABLE}.client_id
    hidden: true

  - dimension: list_id
    type: number
    sql: ${TABLE}.list_id
    hidden: true

  - dimension: subscriber_id
    type: number
    sql: ${TABLE}.subscriber_id
    hidden: true

#-- measures

  - measure: list_subscriber_cnt
    label: 'List Subscribers'
    type: count
    description: 'Count of list subscriber occurrences.'  
    
  - measure: subscriber_cnt
    label: 'Subscribers'
    type: count_distinct
    value_format_name: decimal_0
    sql: ${subscriber_id}
    description: 'Distinct Subscriber Count'

#-- dimension

  - dimension: last_event_day_cnt
    view_label: Days Since Last Event
    label: 'Days Since Last Event'
    type: number
    sql: ${TABLE}.last_event_day_cnt


  - dimension: engagement_cd
    view_label: Engagement Flag
    label: 'Engagement Flag'
    type: string
    sql: ${TABLE}.engagement_cd


  - dimension: date_joined
    view_label: List Subscriber
    label: 'Joined'
    type: time
    timeframes: [hour_of_day, day_of_week, date, week, month, year]
    sql: ${TABLE}.sub_dt


  - dimension: join_type
    view_label: List Subscriber
    label: 'Joined Type'
    type: string
    sql: ${TABLE}.add_method
    
  - dimension: date_unsubscribed
    view_label: List Subscriber
    label: 'Unsubscribed Date'
    type: date_date
    sql: ${TABLE}.unsub_dt
    
  - dimension: unsubscribed_fl
    view_label: List Subscriber
    label: 'Unsubscribed'
    type: yesno
    sql: ${date_unsubscribed} is not null


