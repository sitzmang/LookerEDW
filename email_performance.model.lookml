- label:      'Email Performance'
- connection: edwrpt

- include: '*.view.lookml'       # include all the views
- include: '*.dashboard.lookml'  # include all the dashboards


- explore: em_send_f
  label: 'Email Sends'
  view_label: '1) Measures'
  persist_for: 1 hours
  always_join: [et_send_jobs]
  joins:
    - join: send_date_dm
      from: date_dm
      view_label: '2) Date Sent'
      sql_on: ${send_date_dm.date_sid} = ${em_send_f.sent_date_sid}
      type: inner
      relationship: many_to_one
 
    - join: et_business_unit_lkp
      view_label: '3) Business Unit'
      sql_on: ${et_business_unit_lkp.client_id} = ${em_send_f.client_id}
      type: inner
      relationship: many_to_one

    - join: et_send_jobs
      view_label: 'Email'
      sql_on:    ${et_send_jobs.client_id} = ${em_send_f.client_id}
             and ${et_send_jobs.send_id}   = ${em_send_f.send_id}
             and lower( ${et_send_jobs.subject} ) not like 'test send%'
      type: inner
      relationship: many_to_one

    - join: et_subscribers
      view_label: 'Subscriber'
      sql_on:    ${et_subscribers.client_id}     = ${em_send_f.client_id}
             and ${et_subscribers.subscriber_id} = ${em_send_f.subscriber_id}
      type: inner
      relationship: many_to_one

    - join: et_lists
      view_label: 'List'
      sql_on:    ${et_lists.client_id} = ${em_send_f.client_id}
             and ${et_lists.list_id}   = ${em_send_f.list_id}
      type: inner
      relationship: many_to_one

    - join: et_list_membership
      view_label: 'List Subscriber'
      sql_on:    ${et_list_membership.client_id}     = ${em_send_f.client_id}
             and ${et_list_membership.list_id}       = ${em_send_f.list_id}
             and ${et_list_membership.subscriber_id} = ${em_send_f.subscriber_id}
      type: left_outer
      relationship: many_to_one

