- label:      'List Size'
- connection: edwrpt
- case_sensitive: false

- include: '*.view.lookml'       # include all the views
- include: '*.dashboard.lookml'  # include all the dashboards


- explore: em_list_subscriber_rpt
  label: 'List Size'
  view_label: '1) Measures'
  persist_for: 8 hours
  joins:
    - join: em_bu_dm
      view_label: 'Business Unit'
      sql_on: ${em_bu_dm.src_client_id} = ${em_list_subscriber_rpt.client_id}
      type: left_outer
      relationship: many_to_one
      
    - join: em_list_membership_dm
      view_label: 'List Subscriber'
      sql_on: ${em_list_membership_dm.src_client_id}     = ${em_list_subscriber_rpt.client_id}
        and   ${em_list_membership_dm.src_list_id}       = ${em_list_subscriber_rpt.list_id}
        and   ${em_list_membership_dm.src_subscriber_id} = ${em_list_subscriber_rpt.subscriber_id}
      type: left_outer
      relationship: many_to_one

    - join: em_subscriber_dm
      view_label: 'Subscriber'
      sql_on: ${em_subscriber_dm.src_subscriber_id} = ${em_list_subscriber_rpt.subscriber_id}
          and ${em_subscriber_dm.src_client_id} = ${em_list_subscriber_rpt.client_id}
      type: left_outer
      relationship: many_to_one

    - join: em_list_dm
      view_label: 'List'
      sql_on: ${em_list_dm.src_list_id} = ${em_list_subscriber_rpt.list_id}
      type: left_outer
      relationship: many_to_one


 


