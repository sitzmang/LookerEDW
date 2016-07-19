- view: em_send_f
  sql_table_name: RPT.MAIN.GS_EM_SEND_F
  fields:

#-- fk

  - dimension: sent_date_sid
    type: string
    sql: ${TABLE}.SENT_DATE_SID
    hidden: true

  - dimension: client_id
    type: number
    sql: ${TABLE}.CLIENT_ID
    hidden: true

  - dimension: subscriber_id
    type: number
    sql: ${TABLE}.SUBSCRIBER_ID
    hidden: true

  - dimension: send_id
    type: number
    sql: ${TABLE}.SEND_ID
    hidden: true

  - dimension: list_id
    type: number
    sql: ${TABLE}.LIST_ID
    hidden: true

  - dimension: sent_dt
    type: string
    sql: ${TABLE}.SENT_DT
    hidden: true

  - measure: open_bt
    type: number
    sql: ${TABLE}.open_bt
    hidden: true
    
  - measure: click_bt
    type: number
    sql: ${TABLE}.click_bt
    hidden: true
    
  - measure: complaint_bt
    type: number
    sql: ${TABLE}.complaint_bt
    hidden: true
    
  - measure: unsub_bt
    type: number
    sql: ${TABLE}.unsub_bt
    hidden: true
    
#-- measures

  - measure: subscriber_cnt
    label: 'Subscribers'
    type: count_distinct
    value_format_name: decimal_0
    sql: ${subscriber_id}
    description: 'Distinct Subscriber Count'

  - measure: subscriber_opened_cnt
    label: 'Subscribers Opened'
    type: count_distinct
    value_format_name: decimal_0
    sql: nullif( ${subscriber_id} * ${open_bt}, 0 ) 
    description: 'Distinct Subscribers Who Opened'

  - measure: subscriber_clicked_cnt
    label: 'Subscribers Clicked'
    type: count_distinct
    value_format_name: decimal_0
    sql: nullif( ${subscriber_id} * ${click_bt}, 0 ) 
    description: 'Distinct Subscribers Who Clicked'

  - measure: email_send_cnt
    label: 'Sends'
    type: count
    description: 'Count of subscriber emails sent.'
    
  - measure: email_open_cnt
    label: 'Opens'
    type: sum
    sql: cast( ${open_bt} as decimal( 10,2 ) )
    description: 'Count of sent that opened.'
    
  - measure: email_click_cnt
    label: 'Clicks'
    type: sum
    sql: cast( ${click_bt} as decimal( 12,2 ) )
    description: 'Count of sent that clicked through.'
    
  - measure: email_complaint_cnt
    label: 'Complaints'
    type: sum
    sql: cast( ${complaint_bt} as decimal( 10,2 ) )
    description: 'Count of sent with a complaint.'
    
  - measure: email_unsub_cnt
    label: 'Unsubscribes'
    type: sum
    sql: cast( ${unsub_bt} as decimal( 10,2 ) )
    description: 'Count of sent that unsubscribed.'
    
  - measure: open_rate_pct
    label: 'Open Rate'
    type: number
    sql: ${email_open_cnt}/NULLIF(${email_send_cnt},0)
    value_format: '0.00%'
    description: 'Opens / Sends'
    
  - measure: click_rate_pct
    label: 'Click Rate (Opens)'
    type: number
    sql: ${email_click_cnt}/NULLIF(${email_open_cnt},0)
    value_format: '0.00%'
    description: 'Clicks / Opens'
    
  - measure: click_rate_send_pct
    label: 'Click Rate (Sends)'
    type: number
    sql: ${email_click_cnt}/NULLIF(${email_send_cnt},0)
    value_format: '0.00%'
    description: 'Clicks / Sends'
    
  - measure: complaint_rate_pct
    label: 'Complaint Rate'
    type: number
    sql: ${email_complaint_cnt}/NULLIF(${email_send_cnt},0)
    value_format: '0.00%'
    description: 'Complaints / Sends'
    
  - measure: unsubs_rate_pct
    label: 'Unsubscribe Rate'
    type: number
    sql: ${email_unsub_cnt}/NULLIF(${email_send_cnt},0)
    value_format: '0.00%'
    description: 'Unsubscribers / Sends'

  - measure: avg_subscriber_sends
    label: 'Avg Subscriber Sends'
    type: number
    value_format_name: decimal_1
    sql: ${email_send_cnt} / nullif( ${subscriber_cnt}, 0 )
    description: 'Sends / Subscribers'
    
  - measure: avg_subscriber_opens
    label: 'Avg Subscriber Opens'
    type: number
    value_format_name: decimal_1
    sql: ${email_open_cnt} / nullif( ${subscriber_cnt}, 0 )
    description: 'Opens / Subscribers'
    
  - measure: avg_subscriber_clicks
    label: 'Avg Subscriber Clicks'
    type: number
    value_format_name: decimal_1
    sql: ${email_open_cnt} / nullif( ${subscriber_cnt}, 0 )
    description: 'Clicks / Subscribers'


