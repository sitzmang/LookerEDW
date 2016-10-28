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
    view_label: Engagement Recency
    label: 'Days Since Last Event'
    type: number
    sql: ${TABLE}.last_event_day_cnt


  - dimension: engagement_cd
    view_label: Engagement Status
    label: 'Engagement Status'
    type: string
    sql: ${TABLE}.engagement_cd




