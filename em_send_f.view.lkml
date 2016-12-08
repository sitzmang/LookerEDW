view: em_send_f {
  sql_table_name: RPT.MAIN.EM_SEND_F ;;
  #-- fk

  dimension: sent_date_sid {
    type: string
    sql: ${TABLE}.SENT_DATE_SID ;;
    hidden: yes
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.CLIENT_ID ;;
    hidden: yes
  }

  dimension: subscriber_id {
    type: number
    sql: ${TABLE}.SUBSCRIBER_ID ;;
    hidden: yes
  }

  dimension: send_id {
    type: number
    sql: ${TABLE}.SEND_ID ;;
    hidden: yes
  }

  dimension: list_id {
    type: number
    sql: ${TABLE}.LIST_ID ;;
    hidden: yes
  }

  dimension: sent_dt {
    type: string
    sql: ${TABLE}.SENT_DT ;;
    hidden: yes
  }

  dimension: open_bt {
    type: number
    sql: ${TABLE}.open_bt ;;
    hidden: yes
  }

  dimension: click_bt {
    type: number
    sql: ${TABLE}.click_bt ;;
    hidden: yes
  }

  dimension: complaint_bt {
    type: number
    sql: ${TABLE}.complaint_bt ;;
    hidden: yes
  }

  dimension: unsub_bt {
    type: number
    sql: ${TABLE}.unsub_bt ;;
    hidden: yes
  }

  #-- measures email

  measure: email_send_cnt {
    label: "Sends"
    group_label: "Emails"
    type: count
    description: "Count of subscriber emails sent."
  }

  measure: email_send_cnt_prev {
    label: "Sends"
    view_label: "1b) % Prev"
    type: percent_of_previous
    value_format: "0.0\%"
    sql: ${email_send_cnt} ;;
  }

  measure: email_unsub_cnt {
    label: "Send Unsubs"
    group_label: "Emails"
    type: sum
    sql: ${unsub_bt} ;;
    description: "Count of unsubs within an email send."
  }

  measure: email_unsub_rate_pct {
    label: "Send Unsub Rate"
    group_label: "Emails"
    type: number
    sql: cast( ${email_unsub_cnt} as float )/NULLIF(${email_send_cnt},0) ;;
    value_format: "0.00%"
    description: "Send Unsubs / Sends"
  }

  measure: email_open_cnt {
    label: "Opens"
    group_label: "Emails"
    type: sum
    sql: ${open_bt} ;;
    description: "Count of sent that opened."
  }

  measure: open_rate_pct {
    label: "Open Rate"
    group_label: "Emails"
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
    group_label: "Emails"
    type: sum
    sql: ${click_bt} ;;
    description: "Count of sent that clicked through."
  }

  measure: click_rate_pct {
    label: "Click Rate (Opens)"
    group_label: "Emails"
    type: number
    sql: cast( ${email_click_cnt} as float )/NULLIF(${email_open_cnt},0) ;;
    value_format: "0.00%"
    description: "Clicks / Opens"
  }

  measure: click_rate_send_pct {
    label: "Click Rate (Sends)"
    group_label: "Emails"
    type: number
    sql: cast( ${email_click_cnt} as float )/NULLIF(${email_send_cnt},0) ;;
    value_format: "0.00%"
    description: "Clicks / Sends"
  }

  measure: email_complaint_cnt {
    label: "Complaints"
    group_label: "Emails"
    type: sum
    sql: ${complaint_bt} ;;
    description: "Count of sent with a complaint."
  }

  measure: complaint_rate_pct {
    label: "Complaint Rate"
    group_label: "Emails"
    type: number
    sql: cast( ${email_complaint_cnt} as float )/NULLIF(${email_send_cnt},0) ;;
    value_format: "0.00%"
    description: "Complaints / Sends"
  }

  #-- measures file

  measure: subscriber_cnt {
    label: "Subscribers"
    group_label: "Subscribers"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${subscriber_id} ;;
    description: "Distinct Subscriber Count"
  }

  measure: subscriber_cnt_prev {
    label: "Subscribers"
    view_label: "1b) % Prev"
    type: percent_of_previous
    value_format: "0.0\%"
    sql: ${subscriber_cnt} ;;
  }

  measure: subscriber_opened_cnt {
    label: "Subscribers Opened"
    group_label: "Subscribers"
    type: count_distinct
    value_format_name: decimal_0
    sql: nullif( ${subscriber_id} * ${open_bt}, 0 ) ;;
    description: "Distinct Subscribers Who Opened"
  }

  measure: subscriber_open_rate_pct {
    label: "Subscriber Open Rate"
    group_label: "Subscribers"
    type: number
    sql: cast( ${subscriber_opened_cnt} as float)/NULLIF(${subscriber_cnt},0) ;;
    value_format: "0.00%"
    description: "Subscribers Opened / Subscribers"
  }

  measure: subscriber_clicked_cnt {
    label: "Subscribers Clicked"
    group_label: "Subscribers"
    type: count_distinct
    value_format_name: decimal_0
    sql: nullif( ${subscriber_id} * ${click_bt}, 0 ) ;;
    description: "Distinct Subscribers Who Clicked"
  }

  measure: subscriber_click_rate_pct {
    label: "Subscriber Click Rate"
    group_label: "Subscribers"
    type: number
    sql: cast( ${subscriber_clicked_cnt} as float)/NULLIF(${subscriber_cnt},0) ;;
    value_format: "0.00%"
    description: "Subscribers Clicked / Subscribers"
  }

  measure: subscriber_unsub_cnt {
    label: "Subscribers Unsubed"
    group_label: "Subscribers"
    type: count_distinct
    sql: nullif( ${subscriber_id} * ${unsub_bt}, 0 ) ;;
    description: "Distinct Subscribers Who Unsubed."
  }

  measure: subscriber_unsub_rate_pct {
    label: "Subscribers Unsub Rate"
    group_label: "Subscribers"
    type: number
    sql: cast( ${subscriber_unsub_cnt} as float )/NULLIF(${subscriber_cnt},0) ;;
    value_format: "0.00%"
    description: "Subscribers Unsubed / Subscribers"
  }

  measure: avg_subscriber_sends {
    label: "Avg Subscriber Sends"
    group_label: "Subscribers"
    type: number
    value_format_name: decimal_1
    sql: ${email_send_cnt} / nullif( ${subscriber_cnt}, 0 ) ;;
    description: "Sends / Subscribers"
  }

  measure: avg_subscriber_sends_prev {
    label: "Avg Subscriber Sends"
    view_label: "1b) % Prev"
    type: percent_of_previous
    value_format: "0.0\%"
    sql: ${avg_subscriber_sends} ;;
  }

  measure: avg_subscriber_opens {
    label: "Avg Subscriber Opens"
    group_label: "Subscribers"
    type: number
    value_format_name: decimal_1
    sql: ${email_open_cnt} / nullif( ${subscriber_cnt}, 0 ) ;;
    description: "Opens / Subscribers"
  }

  measure: avg_subscriber_clicks {
    label: "Avg Subscriber Clicks"
    group_label: "Subscribers"
    type: number
    value_format_name: decimal_1
    sql: ${email_open_cnt} / nullif( ${subscriber_cnt}, 0 ) ;;
    description: "Clicks / Subscribers"
  }
}
