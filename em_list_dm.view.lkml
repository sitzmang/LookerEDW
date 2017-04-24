view: em_list_dm {
  sql_table_name: rpt.main.em_list_dm ;;
  #-- fk

  dimension: em_list_shk {
    type: string
    sql: ${TABLE}.em_list_shk ;;
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

  dimension: src_list_id {
    label: "List ID"
    type: number
    sql: ${TABLE}.src_list_id ;;
    hidden: no
  }

  dimension: deb_list_bt {
    type: number
    sql: ${TABLE}.deb_list_bt ;;
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
    sql: ${TABLE}.list_dscr ;;
  }

  dimension: list_status {
    label: "List Status"
    type: string
    sql: ${TABLE}.list_status ;;
  }

  dimension: list_type {
    label: "List Type"
    type: string
    sql: ${TABLE}.list_type ;;
  }

  dimension: created_dt {
    label: "Created Date"
    type: date
    sql: ${TABLE}.created_dt ;;
  }

  dimension: deb_list_fl {
    label: "DEB List"
    type: yesno
    sql: ${deb_list_bt} = 1 ;;
    description: "List is used for DEB sends"
  }
}
