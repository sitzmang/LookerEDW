view: em_event_f {
  sql_table_name: rpt.main.em_event_f ;;
  #-- fk

  dimension: email_sales_channel_shk {
    type: string
    sql: ${TABLE}.email_sales_channel_shk ;;
    hidden: yes
  }

  dimension: order_sales_channel_shk {
    type: string
    sql: ${TABLE}.order_sales_channel_shk ;;
    hidden: yes
  }

  dimension: em_bu_shk {
    type: string
    sql: ${TABLE}.em_bu_shk ;;
    hidden: yes
  }

  dimension: send_date_sid {
    type: number
    sql: ${TABLE}.send_date_sid ;;
    hidden: yes
  }

  dimension: event_date_sid {
    type: number
    sql: ${TABLE}.event_date_sid ;;
    hidden: yes
  }

  dimension: em_event_type_sid {
    type: number
    sql: ${TABLE}.em_event_type_sid ;;
    hidden: yes
  }

  dimension: em_email_shk {
    type: string
    sql: ${TABLE}.em_email_shk ;;
    hidden: yes
  }

  dimension: em_list_shk {
    type: string
    sql: ${TABLE}.em_list_shk ;;
    hidden: yes
  }

  dimension: em_subscriber_shk {
    type: string
    sql: ${TABLE}.em_subscriber_shk ;;
    hidden: yes
  }

  dimension: em_list_membership_shk {
    type: string
    sql: ${TABLE}.em_list_membership_shk ;;
    hidden: yes
  }

  dimension: elapsed_day_sid {
    type: number
    sql: ${TABLE}.elapsed_day_sid ;;
    hidden: yes
  }

  dimension: em_attribution_type_sid {
    type: number
    sql: ${TABLE}.em_attribution_type_sid ;;
    hidden: yes
  }

  #-- keys for distinct events

  dimension: subscriber_event_str {
    type: string
    hidden: yes
    sql: ${em_subscriber_shk}||'x'||${send_date_sid}||'x'||${em_email_shk} ;;
  }

  #-- measures email (all)

  measure: email_event_cnt {
    label: "Events"
    group_label: "Emails(Total)"
    type: count
    description: "Count of events."
    hidden: yes
  }

  measure: em_event_cnt_ttl {
    label: "Events Total"
    group_label: "Emails(Total)"
    type: sum
    sql: ${TABLE}.em_event_cnt ;;
    description: "Sum of events."
    hidden: yes
  }

  measure: email_open_cnt_ttl {
    label: "Opens Total "
    group_label: "Emails(Total)"
    type: sum
    value_format_name: decimal_0
    sql: ${em_event_type_dm.open_bt} ;;
    description: "Total occurrences of sent that opened."
  }

  measure: email_click_cnt_ttl {
    label: "Clicks Total "
    group_label: "Emails(Total)"
    type: sum
    value_format_name: decimal_0
    sql: ${em_event_type_dm.click_bt} ;;
    description: "Total occurrences of sent that clicked."
  }

  #-- measures email (distinct)

  dimension: first_event_bt {
    type: number
    sql: ${TABLE}.first_event_bt ;;
    hidden: yes
  }

  measure: first_event_cnt {
    label: "First Events"
    group_label: "Emails(Distinct)"
    type: sum
    sql: ${first_event_bt} ;;
    description: "Sum of first events only."
    hidden: yes
  }

  measure: email_sent_cnt {
    label: "Emails Sent"
    group_label: "Emails(Distinct)"
    type: count_distinct
    value_format_name: decimal_0
    sql: case when ${em_event_type_dm.sent_bt} = 1 then ${em_email_shk} else to_char( null ) end ;;
    description: "Distinct emails sent."
  }

  measure: email_signup_cnt {
    label: "Signups"
    group_label: "Emails(Distinct)"
    type: sum
    sql: ${first_event_bt} * ${em_event_type_dm.signup_bt} ;;
    description: "Count of subscriber list signups."
    hidden: no
  }

  measure: email_send_cnt {
    label: "Sends"
    group_label: "Emails(Distinct)"
    type: sum
    sql: ${em_event_type_dm.sent_bt} ;;
    description: "Count of subscriber emails sent."
  }

  measure: email_net_send_cnt {
    label: "Sends Net"
    group_label: "Emails(Distinct)"
    type: number
    sql: ${email_send_cnt} - cast( ${email_bounce_cnt} as float );;
    description: "Net emails sent (sends - bounces)."
  }

  measure: email_open_cnt {
    label: "Opens"
    group_label: "Emails(Distinct)"
    type: sum
    value_format_name: decimal_0
    sql: ${first_event_bt} * ${em_event_type_dm.open_bt} ;;
    description: "Count of sent that opened."
  }

  measure: open_rate_pct {
    label: "Open Rate"
    group_label: "Emails(Distinct)"
    type: number
    sql: cast( ${email_open_cnt} as float)/NULLIF(${email_send_cnt},0) ;;
    value_format: "0.00%"
    description: "Opens / Sends"
  }

  measure: open_rate_pct_prev {
    label: "Open Rate"
    view_label: "1b) % Prev"
    type: percent_of_previous
    value_format: "0.0\%"
    sql: ${open_rate_pct} ;;
  }

  measure: email_click_cnt {
    label: "Clicks"
    group_label: "Emails(Distinct)"
    type: sum
    sql: ${first_event_bt} * ${em_event_type_dm.click_bt} ;;
    description: "Count of sent that clicked through."
  }

  measure: click_rate_pct {
    label: "Click Rate (Opens)"
    group_label: "Emails(Distinct)"
    type: number
    sql: cast( ${email_click_cnt} as float )/NULLIF(${email_open_cnt},0) ;;
    value_format: "0.00%"
    description: "Clicks / Opens"
  }

  measure: click_rate_send_pct {
    label: "Click Rate (Sends)"
    group_label: "Emails(Distinct)"
    type: number
    sql: cast( ${email_click_cnt} as float )/NULLIF(${email_send_cnt},0) ;;
    value_format: "0.00%"
    description: "Clicks / Sends"
  }

  measure: email_unsub_cnt {
    label: "Unsubs"
    group_label: "Emails(Distinct)"
    type: sum
    sql: ${first_event_bt} * ${em_event_type_dm.unsub_bt} ;;
    description: "Count of unsubs within an email send."
  }

  measure: email_unsub_rate_pct {
    label: "Unsub Rate"
    group_label: "Emails(Distinct)"
    type: number
    sql: cast( ${email_unsub_cnt} as float )/NULLIF(${email_send_cnt},0) ;;
    value_format: "0.00%"
    description: "Send Unsubs / Sends"
  }

  measure: email_bounce_cnt {
    label: "Bounces"
    group_label: "Emails(Distinct)"
    type: sum
    sql: ${first_event_bt} * ${em_event_type_dm.bounce_bt} ;;
    description: "Count of sent with a bounce."
  }

  measure: bounce_rate_pct {
    label: "Bounce Rate"
    group_label: "Emails(Distinct)"
    type: number
    sql: cast( ${email_bounce_cnt} as float )/NULLIF(${email_send_cnt},0) ;;
    value_format: "0.00%"
    description: "Bounces / Sends"
  }

  measure: delivery_rate_pct {
    label: "Delivery Rate"
    group_label: "Emails(Distinct)"
    type: number
    sql: (${email_send_cnt} - cast( ${email_bounce_cnt} as float ))/NULLIF(${email_send_cnt},0) ;;
    value_format: "0.00%"
    description: "(Sends - Bounces) / Sends"
  }

  measure: email_complaint_cnt {
    label: "Complaints"
    group_label: "Emails(Distinct)"
    type: sum
    sql: ${first_event_bt} * ${em_event_type_dm.complaint_bt} ;;
    description: "Count of sent with a complaint."
  }

  measure: complaint_rate_pct {
    label: "Complaint Rate"
    group_label: "Emails(Distinct)"
    type: number
    sql: cast( ${email_complaint_cnt} as float )/NULLIF(${email_send_cnt},0) ;;
    value_format: "0.00%"
    description: "Complaints / Sends"
  }

  #-- sales

  measure: order_cnt {
    label: "Orders"
    group_label: "Sales"
    type: sum
    sql: ${em_event_type_dm.order_bt} ;;
    description: "Count of orders."
  }

  measure: sales_amt {
    label: "Sales $"
    group_label: "Sales"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.SALES_AMT ;;
    description: "Product Sales + Shipping Sales"
  }

  measure: sales_amt_pttl {
    label: "Sales $"
    group_label: "Sales"
    view_label: "1c) % Total"
    type: percent_of_total
    value_format: "0.0\%"
    sql: ${sales_amt} ;;
    description: "Sales $ (Current Period) / Sales $ (All Periods)"
  }

  measure: avg_order_sales_amt {
    label: "AOV Sales $"
    group_label: "Sales"
    type: number
    value_format_name: usd
    sql: ${sales_amt} / nullif( ${order_cnt}, 0 ) ;;
    description: "Sales / Orders"
  }

  measure: product_margin_amt {
    label: "Product Margin $"
    group_label: "Sales"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.product_margin_amt ;;
    description: "Product Margin Amount."
  }

  measure: sales_amt_pm {
    label: "RPM $"
    group_label: "Sales"
    type: number
    value_format: "$0.0000"
    sql: ( cast( ${sales_amt} as float ) / NULLIF(${email_send_cnt},0) ) * 1000 ;;
    description: "(Sales / Sends) * 1000 = Revenue per 1000 Sent"
  }

  measure: product_margin_amt_pm {
    label: "Product Margin/1000 Sent"
    group_label: "Sales"
    type: number
    value_format: "$0.0000"
    sql: ( cast( ${product_margin_amt} as float ) / NULLIF(${email_send_cnt},0) ) * 1000 ;;
    description: "(Product Margin $ / Sends) * 1000"
  }

  measure: click_order_rate_pct {
    label: "Order Rate (Clicks)"
    group_label: "Sales"
    type: number
    sql: cast( ${order_cnt} as float )/NULLIF(${email_click_cnt},0) ;;
    value_format: "0.00%"
    description: "Orders / Clicks"
  }

  measure: avg_subscriber_sales_amt_pm {
    label: "Sales/1000 Subscribers"
    group_label: "Sales"
    type: number
    value_format: "$0.0000"
    sql: ( cast( ${sales_amt} as float ) / NULLIF(${subscriber_sent_cnt},0) ) * 1000 ;;
    description: "(Sales / Subscribers Sent) * 1000"
  }

  measure: avg_subscriber_product_margin_amt_pm {
    label: "Product Margin/1000 Subscribers"
    group_label: "Sales"
    type: number
    value_format: "$0.0000"
    sql: ( cast( ${product_margin_amt} as float ) / NULLIF(${subscriber_sent_cnt},0) ) * 1000 ;;
    description: "(Product Margin / Subscribers Sent) * 1000"
  }

  measure: subscriber_order_cnt {
    label: "Subscribers Ordered"
    group_label: "Sales"
    type: count_distinct
    value_format_name: decimal_0
    sql: case when ${em_event_type_dm.order_bt} = 1 then ${em_subscriber_shk} else to_char( null ) end ;;
    description: "Distinct Subscribers Who Ordered"
  }

  measure: subscriber_order_rate_pct {
    label: "Subscribers Order Rate (Clicked)"
    group_label: "Sales"
    type: number
    sql: cast( ${subscriber_order_cnt} as float )/NULLIF(${subscriber_clicked_cnt},0) ;;
    value_format: "0.00%"
    description: "Subscribers Ordered / Subscribers Clicked"
  }

  #-- subscribers

  measure: subscriber_signup_cnt {
    label: "Subscribers Signed Up"
    group_label: "Subscribers"
    type: count_distinct
    value_format_name: decimal_0
    sql: case when ${em_event_type_dm.signup_bt} = 1 then ${em_subscriber_shk} else to_char( null ) end;;
    description: "Distinct Subscribers Who Signed Up"
    hidden: no
  }

  measure: subscriber_sent_cnt {
    label: "Subscribers Sent"
    group_label: "Subscribers"
    type: count_distinct
    value_format_name: decimal_0
    sql: case when ${em_event_type_dm.sent_bt} = 1 then ${em_subscriber_shk} else to_char( null ) end ;;
    description: "Distinct Subscribers Who Were Sent"
  }

  measure: subscriber_opened_cnt {
    label: "Subscribers Opened"
    group_label: "Subscribers"
    type: count_distinct
    value_format_name: decimal_0
    sql: case when ${em_event_type_dm.open_bt} = 1 then ${em_subscriber_shk} else to_char( null ) end ;;
    description: "Distinct Subscribers Who Opened"
  }

  measure: subscriber_open_rate_pct {
    label: "Subscribers Open Rate"
    group_label: "Subscribers"
    type: number
    sql: cast( ${subscriber_opened_cnt} as float)/NULLIF(${subscriber_sent_cnt},0) ;;
    value_format: "0.00%"
    description: "Subscribers Opened / Subscribers Sent"
  }

  measure: subscriber_bounce_cnt {
    label: "Subscribers Bounced"
    group_label: "Subscribers"
    type: count_distinct
    value_format_name: decimal_0
    sql: case when ${em_event_type_dm.bounce_bt} = 1 then ${em_subscriber_shk} else to_char( null ) end ;;
    description: "Distinct Subscribers Who Bounced"
  }

  measure: subscriber_bounce_rate_pct {
    label: "Subscribers Bounce Rate"
    group_label: "Subscribers"
    type: number
    sql: cast( ${subscriber_bounce_cnt} as float)/NULLIF(${subscriber_sent_cnt},0) ;;
    value_format: "0.00%"
    description: "Subscribers Bounced / Subscribers Sent"
  }

  measure: subscriber_clicked_cnt {
    label: "Subscribers Clicked"
    group_label: "Subscribers"
    type: count_distinct
    value_format_name: decimal_0
    sql: case when ${em_event_type_dm.click_bt} = 1 then ${em_subscriber_shk} else to_char( null ) end ;;
    description: "Distinct Subscribers Who Clicked"
  }

  measure: subscriber_click_rate_pct {
    label: "Subscribers Click Rate"
    group_label: "Subscribers"
    type: number
    sql: cast( ${subscriber_clicked_cnt} as float)/NULLIF(${subscriber_sent_cnt},0) ;;
    value_format: "0.00%"
    description: "Subscribers Clicked / Subscribers Sent"
  }

  measure: subscriber_complaint_cnt {
    label: "Subscribers Complained"
    group_label: "Subscribers"
    type: count_distinct
    sql: case when ${em_event_type_dm.complaint_bt} = 1 then ${em_subscriber_shk} else to_char( null ) end ;;
    description: "Distinct Subscribers Who Complained."
  }

  measure: subscriber_complaint_rate_pct {
    label: "Subscribers Complaint Rate"
    group_label: "Subscribers"
    type: number
    sql: cast( ${subscriber_complaint_cnt} as float )/NULLIF(${subscriber_sent_cnt},0) ;;
    value_format: "0.00%"
    description: "Subscribers Complained / Subscribers Sent"
  }

  measure: subscriber_unsub_cnt {
    label: "Subscribers Unsubed"
    group_label: "Subscribers"
    type: count_distinct
    sql: case when ${em_event_type_dm.unsub_bt} = 1 then ${em_subscriber_shk} else to_char( null ) end ;;
    description: "Distinct Subscribers Who Unsubed."
  }

  measure: subscriber_unsub_rate_pct {
    label: "Subscribers Unsub Rate"
    group_label: "Subscribers"
    type: number
    sql: cast( ${subscriber_unsub_cnt} as float )/NULLIF(${subscriber_sent_cnt},0) ;;
    value_format: "0.00%"
    description: "Subscribers Unsubed / Subscribers"
  }

  measure: avg_subscriber_sends {
    label: "Avg Subscriber Sends"
    group_label: "Subscribers"
    type: number
    value_format_name: decimal_1
    sql: ${email_send_cnt} / nullif( ${subscriber_sent_cnt}, 0 ) ;;
    description: "Sends / Subscribers Sent"
  }

  measure: avg_subscriber_opens {
    label: "Avg Subscriber Opens"
    group_label: "Subscribers"
    type: number
    value_format_name: decimal_1
    sql: ${email_open_cnt} / nullif( ${subscriber_sent_cnt}, 0 ) ;;
    description: "Opens / Subscribers Sent"
  }

  measure: avg_subscriber_clicks {
    label: "Avg Subscriber Clicks"
    group_label: "Subscribers"
    type: number
    value_format_name: decimal_1
    sql: ${email_open_cnt} / nullif( ${subscriber_sent_cnt}, 0 ) ;;
    description: "Clicks / Subscribers Sent"
  }
}
