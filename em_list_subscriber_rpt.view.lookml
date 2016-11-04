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
    
  - measure: subscriber_cnt_pttl
    label: 'Subscribers'
    view_label: '1c) % Total'
    type: percent_of_total
    value_format: '0.00\%'
    sql: ${subscriber_cnt}

  - measure: list_subscriber_cnt_pttl
    label: 'List Subscribers'
    view_label: '1c) % Total'
    type: percent_of_total
    value_format: '0.00\%' 
    sql: ${list_subscriber_cnt}

  - measure: avg_subscriber_lists
    label: 'Avg Subscriber Lists'
    type: number
    value_format_name: decimal_1
    sql: ${list_subscriber_cnt} / nullif( ${subscriber_cnt}, 0 )
    description: 'Average Number of Lists Subscriber is on'



#-- dimension

  - dimension: last_event_day_cnt
    view_label: 'List Subscriber'
    label: 'Last Event Days'
    type: number
    sql: ${TABLE}.last_event_day_cnt
    description: 'Count of days since subscriber''s last event.'

  - dimension: last_event_dt
    view_label: 'List Subscriber'
    label: 'Last Event Date'
    type: date
    sql: ${TABLE}.last_event_dt
    description: 'Subscriber''s last event date.'

  - dimension: engagement_cd
    view_label: 'List Subscriber'
    label: 'Engagement Status'
    type: string
    sql: ${TABLE}.engagement_cd
    description: 'Subscriber engaged/unengaged designation.'



