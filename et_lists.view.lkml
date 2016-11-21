view: et_lists {
  sql_table_name: exacttarget.main.v_et_lists ;;
  #-- fk

  dimension: client_id {
    type: number
    sql: ${TABLE}.client_id ;;
    hidden: yes
  }

  dimension: list_id {
    type: number
    sql: ${TABLE}.list_id ;;
    hidden: yes
  }

  dimension: actual_list_id {
    type: number
    sql: ${TABLE}.actual_list_id ;;
    hidden: yes
  }

  #-- dimensions

  dimension: list_name {
    label: "List Name"
    type: string
    sql: ${TABLE}.list_name ;;
  }

  dimension: list_description {
    label: "List Description"
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: status {
    label: "List Status"
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: list_type {
    label: "List Type"
    type: string
    sql: ${TABLE}.list_type ;;
  }

  dimension: date_created {
    label: "Created Date"
    type: date
    sql: ${TABLE}.date_created ;;
  }
}
