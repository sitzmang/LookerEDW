- view: em_event_f
  sql_table_name: rpt.main.em_event_f
  fields:

#-- fk

  - dimension: sales_channel_shk
    type: number
    sql: ${TABLE}.sales_channel_shk
    hidden: true

  - dimension: send_date_sid
    type: number
    sql: ${TABLE}.send_date_sid
    hidden: true

  - dimension: event_date_sid
    type: number
    sql: ${TABLE}.event_date_sid
    hidden: true

  - dimension: em_event_type_sid
    type: number
    sql: ${TABLE}.em_event_type_sid
    hidden: true

  - dimension: em_email_shk
    type: number
    sql: ${TABLE}.em_email_shk
    hidden: true

  - dimension: em_list_shk
    type: number
    sql: ${TABLE}.em_list_shk
    hidden: true

  - dimension: em_subscriber_shk
    type: number
    sql: ${TABLE}.em_subscriber_shk
    hidden: true

  - dimension: em_list_membership_shk
    type: number
    sql: ${TABLE}.em_list_membership_shk
    hidden: true

  - dimension: em_attribution_type_sid
    type: number
    sql: ${TABLE}.em_attribution_type_sid
    hidden: true

  - dimension: elapsed_day_sid
    type: number
    sql: ${TABLE}.elapsed_day_sid
    hidden: true


#-- measures email

  - measure: email_event_cnt
    label: 'Events'
    group_label: 'Emails'
    type: count
    description: 'Count of events.'
    
  - measure: em_event_cnt_ttl
    label: 'Events Total'
    group_label: 'Emails'
    type: sum
    sql: ${TABLE}.em_event_cnt
    description: 'Sum of events.'
    
  - measure: email_signup_cnt
    label: 'Signups'
    group_label: 'Emails'
    type: sum
    sql: ${em_event_type_dm.signup_bt}
    description: 'Count of subscriber list signups.'
    
  - measure: email_send_cnt
    label: 'Sends'
    group_label: 'Emails'
    type: sum
    sql: ${em_event_type_dm.sent_bt}
    description: 'Count of subscriber emails sent.'
    
  - measure: email_open_cnt
    label: 'Opens'
    group_label: 'Emails'
    type: sum
    sql: ${em_event_type_dm.open_bt}
    description: 'Count of sent that opened.'
    
  - measure: open_rate_pct
    label: 'Open Rate'
    group_label: 'Emails'
    type: number
    sql: cast( ${email_open_cnt} as float)/NULLIF(${email_send_cnt},0)
    value_format: '0.00%'
    description: 'Opens / Sends'

  - measure: open_rate_pct_prev
    label: 'Open Rate'
    view_label: '1b) % Prev'
    type: percent_of_previous
    value_format: '0.0\%'
    sql: ${open_rate_pct}

  - measure: email_click_cnt
    label: 'Clicks'
    group_label: 'Emails'
    type: sum
    sql: ${em_event_type_dm.click_bt}
    description: 'Count of sent that clicked through.'
    
  - measure: click_rate_pct
    label: 'Click Rate (Opens)'
    group_label: 'Emails'
    type: number
    sql: cast( ${email_click_cnt} as float )/NULLIF(${email_open_cnt},0)
    value_format: '0.00%'
    description: 'Clicks / Opens'
    
  - measure: click_rate_send_pct
    label: 'Click Rate (Sends)'
    group_label: 'Emails'
    type: number
    sql: cast( ${email_click_cnt} as float )/NULLIF(${email_send_cnt},0)
    value_format: '0.00%'
    description: 'Clicks / Sends'
    
  - measure: email_unsub_cnt
    label: 'Unsubs'
    group_label: 'Emails'
    type: sum
    sql: ${em_event_type_dm.unsub_bt}
    description: 'Count of unsubs within an email send.'
    
  - measure: email_unsub_rate_pct
    label: 'Unsub Rate'
    group_label: 'Emails'
    type: number
    sql: cast( ${email_unsub_cnt} as float )/NULLIF(${email_send_cnt},0)
    value_format: '0.00%'
    description: 'Send Unsubs / Sends'

  - measure: email_bounce_cnt
    label: 'Bounces'
    group_label: 'Emails'
    type: sum
    sql: ${em_event_type_dm.bounce_bt}
    description: 'Count of sent with a bounce.'
    
  - measure: bounce_rate_pct
    label: 'Bounce Rate'
    group_label: 'Emails'
    type: number
    sql: cast( ${email_bounce_cnt} as float )/NULLIF(${email_send_cnt},0)
    value_format: '0.00%'
    description: 'Bounces / Sends'
    
  - measure: email_complaint_cnt
    label: 'Complaints'
    group_label: 'Emails'
    type: sum
    sql: ${em_event_type_dm.complaint_bt}
    description: 'Count of sent with a complaint.'
    
  - measure: complaint_rate_pct
    label: 'Complaint Rate'
    group_label: 'Emails'
    type: number
    sql: cast( ${email_complaint_cnt} as float )/NULLIF(${email_send_cnt},0)
    value_format: '0.00%'
    description: 'Complaints / Sends'
  
    
  - measure: sales_amt
    label: 'Sales $'
    group_label: 'Sales'
    type: sum
    value_format_name: usd
    sql: ${TABLE}.SALES_AMT
    description: 'Product Sales + Shipping Sales'

  - measure: product_margin_amt
    label: 'Product Margin $'
    group_label: 'Sales'
    type: sum
    value_format_name: usd
    sql: ${TABLE}.product_margin_amt
    description: 'Product Margin Amount.'
    
#-- measures file

  - measure: subscriber_signup_cnt
    label: 'Subscribers Signed Up'
    group_label: 'Subscribers'
    type: count_distinct
    value_format_name: decimal_0
    sql: nullif( ${em_subscriber_shk} * ${em_event_type_dm.signup_bt}, 0 ) 
    description: 'Distinct Subscribers Who Signed Up'

  - measure: subscriber_sent_cnt
    label: 'Subscribers Sent'
    group_label: 'Subscribers'
    type: count_distinct
    value_format_name: decimal_0
    sql: nullif( ${em_subscriber_shk} * ${em_event_type_dm.sent_bt}, 0 ) 
    description: 'Distinct Subscribers Who Were Sent'

  - measure: subscriber_opened_cnt
    label: 'Subscribers Opened'
    group_label: 'Subscribers'
    type: count_distinct
    value_format_name: decimal_0
    sql: nullif( ${em_subscriber_shk} * ${em_event_type_dm.open_bt}, 0 ) 
    description: 'Distinct Subscribers Who Opened'

  - measure: subscriber_open_rate_pct
    label: 'Subscribers Open Rate'
    group_label: 'Subscribers'
    type: number
    sql: cast( ${subscriber_opened_cnt} as float)/NULLIF(${subscriber_sent_cnt},0)
    value_format: '0.00%'
    description: 'Subscribers Opened / Subscribers'
    
  - measure: subscriber_clicked_cnt
    label: 'Subscribers Clicked'
    group_label: 'Subscribers'
    type: count_distinct
    value_format_name: decimal_0
    sql: nullif( ${em_subscriber_shk} * ${em_event_type_dm.click_bt}, 0 ) 
    description: 'Distinct Subscribers Who Clicked'

  - measure: subscriber_click_rate_pct
    label: 'Subscribers Click Rate'
    group_label: 'Subscribers'
    type: number
    sql: cast( ${subscriber_clicked_cnt} as float)/NULLIF(${subscriber_sent_cnt},0)
    value_format: '0.00%'
    description: 'Subscribers Clicked / Subscribers'
    
  - measure: subscriber_unsub_cnt
    label: 'Subscribers Unsubed'
    group_label: 'Subscribers'
    type: count_distinct
    sql: nullif( ${em_subscriber_shk} * ${em_event_type_dm.unsub_bt}, 0 )
    description: 'Distinct Subscribers Who Unsubed.'
    
  - measure: subscriber_unsub_rate_pct
    label: 'Subscribers Unsub Rate'
    group_label: 'Subscribers'
    type: number
    sql: cast( ${subscriber_unsub_cnt} as float )/NULLIF(${subscriber_sent_cnt},0)
    value_format: '0.00%'
    description: 'Subscribers Unsubed / Subscribers'

  - measure: avg_subscriber_sends
    label: 'Avg Subscriber Sends'
    group_label: 'Subscribers'
    type: number
    value_format_name: decimal_1
    sql: ${email_send_cnt} / nullif( ${subscriber_sent_cnt}, 0 )
    description: 'Sends / Subscribers'
    
  - measure: avg_subscriber_opens
    label: 'Avg Subscriber Opens'
    group_label: 'Subscribers'
    type: number
    value_format_name: decimal_1
    sql: ${email_open_cnt} / nullif( ${subscriber_sent_cnt}, 0 )
    description: 'Opens / Subscribers'
    
  - measure: avg_subscriber_clicks
    label: 'Avg Subscriber Clicks'
    group_label: 'Subscribers'
    type: number
    value_format_name: decimal_1
    sql: ${email_open_cnt} / nullif( ${subscriber_sent_cnt}, 0 )
    description: 'Clicks / Subscribers'