view: em_email_dm2 {
  sql_table_name: rpt.main.em_email_dm2 ;;
  #-- fk

  dimension: em_email_shk {
    type: number
    sql: ${TABLE}.em_email_shk ;;
    hidden: yes
  }

  dimension: em_bu_shk {
    type: number
    sql: ${TABLE}.em_bu_shk ;;
    hidden: yes
  }

  dimension: src_client_id {
    type: number
    sql: ${TABLE}.src_client_id ;;
    hidden: yes
  }

  dimension: src_send_id {
    label: "Send ID"
    type: number
    sql: ${TABLE}.src_send_id ;;
    hidden: no
  }

  #-- dimensions

  dimension: email_name {
    label: "Email Name"
    type: string
    sql: ${TABLE}.email_name ;;
  }

  dimension: email_type_cd {
    label: "Email Type Cd"
    type: string
    sql: ${TABLE}.email_type_cd ;;
    hidden: yes
  }

  dimension: email_type_name {
    label: "Email Type Name"
    type: string
    sql: ${TABLE}.email_type_name ;;
  }

  dimension: from_name {
    label: "From Name"
    type: string
    sql: ${TABLE}.from_name ;;
  }

  dimension: from_email_adrs {
    label: "From Email Adrs"
    type: string
    sql: ${TABLE}.from_email_adrs ;;
  }

  dimension: subject_line {
    label: "Subject Line"
    type: string
    sql: ${TABLE}.subject_line ;;
  }

  dimension: subject_line_len {
    label: "Subject Line Length"
    type: number
    sql: length( ${TABLE}.subject_line ) ;;
  }
}
