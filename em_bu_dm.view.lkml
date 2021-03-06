view: em_bu_dm {
  sql_table_name: rpt.main.em_bu_dm ;;
  #-- fk

  dimension: em_bu_shk {
    type: string
    sql: ${TABLE}.em_bu_shk ;;
    hidden: yes
  }

  dimension: src_client_id {
    label: "Client ID"
    type: number
    sql: ${TABLE}.src_client_id ;;
    hidden: no
  }

  #-- dimensions

  dimension: company_name {
    label: "  Company Name"
    type: string
    sql: to_char( 'F+W Media' ) ;;
    drill_fields: [business_unit_name]
  }

  dimension: business_unit_name {
    label: " BU Name"
    type: string
    sql: ${TABLE}.business_unit_name ;;
    drill_fields: [em_email_dm.email_type_name, em_subscribers.email_domain]
  }

  dimension: general_mgr_name {
    label: "   GM Name"
    type: string
    sql: ${TABLE}.general_mgr_name ;;
    drill_fields: [business_unit_name]
  }
}
