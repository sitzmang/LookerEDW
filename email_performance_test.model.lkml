label: "Email Performance(test f2)"

connection: "edwrpt"

case_sensitive: no

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: em_event_f2 {
  label: "Email Sends"
  view_label: "1) Measures"
  persist_for: "8 hours"
  always_join: [em_email_dm2]

  join: send_date_dm {
    from: date_dm
    view_label: "2) Date Sent"
    sql_on: ${send_date_dm.date_sid} = ${em_event_f2.send_date_sid} ;;
    type: inner
    relationship: many_to_one
  }

  join: event_date_dm {
    from: date_dm
    view_label: "3) Date of Event"
    sql_on: ${event_date_dm.date_sid} = ${em_event_f2.event_date_sid} ;;
    type: inner
    relationship: many_to_one
  }

  join: email_sales_channel_dm {
    from: sales_channel_dm2
    view_label: "4) Sales Channel(Email)"
    sql_on: ${email_sales_channel_dm.sales_channel_shk} = ${em_event_f2.email_sales_channel_shk} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: order_sales_channel_dm {
    from: sales_channel_dm2
    view_label: "5) Sales Channel(Orders)"
    sql_on: ${order_sales_channel_dm.sales_channel_shk} = ${em_event_f2.order_sales_channel_shk} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: em_attribution_type_dm {
    view_label: "Sales Attribution Type"
    sql_on: ${em_attribution_type_dm.em_attribution_type_sid} = ${em_event_f2.em_attribution_type_sid} ;;
    type: inner
    relationship: many_to_one
  }

  join: em_email_dm2 {
    view_label: "Email"
    sql_on: ${em_email_dm2.em_email_shk} = ${em_event_f2.em_email_shk} and lower( ${em_email_dm2.subject_line} ) not like 'test send%' and lower( ${em_email_dm2.subject_line} ) not like '[test send%' ;;
    type: inner
    relationship: many_to_one
  }

  join: em_event_type_dm {
    view_label: "Email Event"
    sql_on: ${em_event_type_dm.em_event_type_sid} = ${em_event_f2.em_event_type_sid} ;;
    type: inner
    relationship: many_to_one
  }

  join: em_list_dm2 {
    view_label: "List"
    sql_on: ${em_list_dm2.em_list_shk} = ${em_event_f2.em_list_shk} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: em_subscriber_dm2 {
    view_label: "Subscriber"
    sql_on: ${em_subscriber_dm2.em_subscriber_shk} = ${em_event_f2.em_subscriber_shk} and ${em_subscriber_dm2.em_bu_shk} = ${em_event_f2.em_bu_shk} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: elapsed_day_dm {
    view_label: "Elapsed Days"
    sql_on: ${elapsed_day_dm.elapsed_day_sid} = ${em_event_f2.elapsed_day_sid} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: em_list_membership_dm2 {
    view_label: "List Subscriber"
    sql_on: ${em_list_membership_dm2.em_list_membership_shk} = ${em_event_f2.em_list_membership_shk} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: em_bu_dm2 {
    view_label: "Business Unit"
    sql_on: ${em_bu_dm2.em_bu_shk} = ${em_event_f2.em_bu_shk} ;;
    type: left_outer
    relationship: many_to_one
  }
}

explore: em_list_subscriber_rpt {
  label: "List Subscribers"
  view_label: "1) Measures"
  persist_for: "8 hours"

  always_filter: {
    filters: {
      field: engagement_cd
      value: "Engaged"
    }
  }

  join: em_bu_dm2 {
    view_label: "Business Unit"
    sql_on: ${em_bu_dm2.src_client_id} = ${em_list_subscriber_rpt.client_id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: em_list_membership_dm2 {
    view_label: "List Subscriber"
    sql_on: ${em_list_membership_dm2.src_client_id}     = ${em_list_subscriber_rpt.client_id} and   ${em_list_membership_dm2.src_list_id}       = ${em_list_subscriber_rpt.list_id} and   ${em_list_membership_dm2.src_subscriber_id} = ${em_list_subscriber_rpt.subscriber_id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: em_subscriber_dm2 {
    view_label: "Subscriber"
    sql_on: ${em_subscriber_dm2.src_subscriber_id} = ${em_list_subscriber_rpt.subscriber_id} and ${em_subscriber_dm2.src_client_id} = ${em_list_subscriber_rpt.client_id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: em_list_dm2 {
    view_label: "List"
    sql_on: ${em_list_dm2.src_list_id} = ${em_list_subscriber_rpt.list_id} ;;
    type: left_outer
    relationship: many_to_one
  }
}
