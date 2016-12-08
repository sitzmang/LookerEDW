view: em_event_type_dm {
  sql_table_name: rpt.main.em_event_type_dm ;;
  #-- fk

  dimension: em_event_type_sid {
    type: number
    sql: ${TABLE}.em_event_type_sid ;;
    hidden: yes
  }

  #-- dimensions

  dimension: event_type_cd {
    type: string
    sql: ${TABLE}.event_type_cd ;;
    hidden: yes
  }

  dimension: event_type_name {
    label: "Email Event Type Name"
    type: string
    sql: ${TABLE}.event_type_name ;;
    hidden: yes
  }

  #-- other

  dimension: signup_bt {
    type: number
    sql: ${TABLE}.signup_bt ;;
    hidden: yes
  }

  dimension: sent_bt {
    type: number
    sql: ${TABLE}.sent_bt ;;
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

  dimension: bounce_bt {
    type: number
    sql: ${TABLE}.bounce_bt ;;
    hidden: yes
  }

  dimension: unsub_bt {
    type: number
    sql: ${TABLE}.unsub_bt ;;
    hidden: yes
  }

  dimension: complaint_bt {
    type: number
    sql: ${TABLE}.complaint_bt ;;
    hidden: yes
  }

  dimension: order_bt {
    type: number
    sql: ${TABLE}.order_bt ;;
    hidden: yes
  }
}
