- label:      'Email Performance(new)'
- connection: edwrpt
- case_sensitive: false

- include: '*.view.lookml'       # include all the views
- include: '*.dashboard.lookml'  # include all the dashboards


- explore: em_event_f
  label: 'Email Sends'
  view_label: '1) Measures'
  persist_for: 8 hours
  always_join: [em_email_dm]
  joins:
    - join: send_date_dm
      from: date_dm
      view_label: '2) Date Sent'
      sql_on: ${send_date_dm.date_sid} = ${em_event_f.send_date_sid}
      type: inner
      relationship: many_to_one

    - join: event_date_dm
      from: date_dm
      view_label: '3) Date Event'
      sql_on: ${event_date_dm.date_sid} = ${em_event_f.event_date_sid}
      type: inner
      relationship: many_to_one

    - join: sales_channel_dm
      view_label: '4) Sales Channel'
      sql_on: ${sales_channel_dm.sales_channel_shk} = ${em_event_f.sales_channel_shk}
      type: left_outer
      relationship: many_to_one

    - join: em_email_dm
      view_label: 'Email'
      sql_on: ${em_email_dm.em_email_shk} = ${em_event_f.em_email_shk}
             and lower( ${em_email_dm.subject_line} ) not like 'test send%'
             and lower( ${em_email_dm.subject_line} ) not like '[test send%'
      type: left_outer
      relationship: many_to_one
 
    - join: em_event_type_dm
      view_label: 'Email Event'
      sql_on: ${em_event_type_dm.em_event_type_sid} = ${em_event_f.em_event_type_sid}
      type: left_outer
      relationship: many_to_one
 
    - join: em_list_dm
      view_label: 'List'
      sql_on: ${em_list_dm.em_list_shk} = ${em_event_f.em_list_shk}
      type: left_outer
      relationship: many_to_one
 
    - join: em_subscriber_dm
      view_label: 'Subscriber'
      sql_on: ${em_subscriber_dm.em_subscriber_shk} = ${em_event_f.em_subscriber_shk}
      type: left_outer
      relationship: many_to_one
 
    - join: elapsed_day_dm
      view_label: 'Elapsed Days'
      sql_on: ${elapsed_day_dm.elapsed_day_sid} = ${em_event_f.elapsed_day_sid}
      type: left_outer
      relationship: many_to_one
 
    - join: em_list_membership_dm
      view_label: 'List Subscriber'
      sql_on: ${em_list_membership_dm.em_list_membership_shk} = ${em_event_f.em_list_membership_shk}
      type: left_outer
      relationship: many_to_one
