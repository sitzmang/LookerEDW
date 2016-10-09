- view: em_event_type_dm
  sql_table_name: rpt.main.em_event_type_dm
  fields:

#-- fk

  - dimension: em_event_type_sid
    type: number
    sql: ${TABLE}.em_event_type_sid
    hidden: true

#-- dimensions

  - dimension: event_type_cd
    type: string
    sql: ${TABLE}.event_type_cd
    hidden: true
    
  - dimension: event_type_name
    label: 'Email Event Type Name'
    type: string
    sql: ${TABLE}.event_type_name

#-- other

  - measure: signup_bt
    type: number
    sql: ${TABLE}.signup_bt
    hidden: true
    
  - measure: sent_bt
    type: number
    sql: ${TABLE}.sent_bt
    hidden: true
    
  - measure: open_bt
    type: number
    sql: ${TABLE}.open_bt
    hidden: true
    
  - measure: click_bt
    type: number
    sql: ${TABLE}.click_bt
    hidden: true
    
  - measure: bounce_bt
    type: number
    sql: ${TABLE}.bounce_bt
    hidden: true
    
  - measure: unsub_bt
    type: number
    sql: ${TABLE}.unsub_bt
    hidden: true

  - measure: complaint_bt
    type: number
    sql: ${TABLE}.complaint_bt
    hidden: true

  - measure: order_bt
    type: number
    sql: ${TABLE}.order_bt
    hidden: true
