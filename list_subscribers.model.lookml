- label:      'List Subscribers'
- connection: edwrpt
- case_sensitive: false

- include: '*.view.lookml'       # include all the views
- include: '*.dashboard.lookml'  # include all the dashboards


- explore: em_list_subscriber_rpt
  label: 'List Subscribers'
  view_label: '1) Measures'
  persist_for: 8 hours
  joins:
    - join: et_business_unit_lkp
      view_label: '3) Business Unit'
      sql_on: ${et_business_unit_lkp.client_id} = ${em_list_subscriber_rpt.client_id}
      type: inner
      relationship: many_to_one

    - join: et_subscribers
      view_label: 'Subscriber'
      sql_on:    ${et_subscribers.client_id}     = ${em_list_subscriber_rpt.client_id}
             and ${et_subscribers.subscriber_id} = ${em_list_subscriber_rpt.subscriber_id}
      type: left_outer
      relationship: many_to_one

    - join: et_lists
      view_label: 'List'
      sql_on:    ${et_lists.list_id}   = ${em_list_subscriber_rpt.list_id}
      type: left_outer
      relationship: many_to_one


