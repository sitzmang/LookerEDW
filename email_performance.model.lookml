- label:      'Email Performance (Under Development)'
- connection: edwrpt

- include: '*.view.lookml'       # include all the views
- include: '*.dashboard.lookml'  # include all the dashboards


- explore: em_send_f
  label: 'Email Sends'
  view_label: '1) Measures'
  persist_for: 4 hours
  joins:
    - join: send_date_dm
      from: date_dm
      view_label: '2) Date Sent'
      sql_on: ${send_date_dm.date_sid} = ${em_send_f.send_date_sid}
      type: left_outer
      relationship: many_to_one
 
    - join: et_business_unit_lkp
      view_label: '3) Business Unit'
      sql_on: ${et_business_unit_lkp.client_id} = ${em_send_f.client_id}
      type: left_outer
      relationship: many_to_one

    - join: et_send_jobs
      view_label: 'Email'
      sql_on:    ${et_send_jobs.client_id} = ${em_send_f.client_id}
             and ${et_send_jobs.send_id}   = ${em_send_f.send_id}
      type: left_outer
      relationship: many_to_one

    - join: et_subscribers
      view_label: 'Subscriber'
      sql_on:    ${et_subscribers.client_id}     = ${em_send_f.client_id}
             and ${et_subscribers.subscriber_id} = ${em_send_f.subscriber_id}
      type: left_outer
      relationship: many_to_one

