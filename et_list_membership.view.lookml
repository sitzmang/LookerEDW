- view: et_list_membership
  sql_table_name: exacttarget.main.et_list_membership
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

#-- dimensions

  - dimension: date_joined
    label: 'Joined Date'
    type: date_date
    sql: ${TABLE}.date_joined
    
  - dimension: join_type
    label: 'Joined Type'
    type: string
    sql: ${TABLE}.join_type
    
  - dimension: date_unsubscribed
    label: 'Unsubscribed Date'
    type: date_date
    sql: ${TABLE}.date_unsubscribed
    
  - dimension: unsubscribed_fl
    label: 'Unsubscribed'
    type: yesno
    sql: ${date_unsubscribed} is not null

  - dimension: unsubscribe_reason
    label: 'Unsubscribed Reason'
    type: string
    sql: ${TABLE}.unsubscribe_reason
    
