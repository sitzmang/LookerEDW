view: em_attribution_type_dm {
  sql_table_name: rpt.main.em_attribution_type_dm ;;
  #-- fk

  dimension: em_attribution_type_sid {
    type: number
    sql: ${TABLE}.em_attribution_type_sid ;;
    hidden: yes
  }

  #-- dimensions

  dimension: attribution_type_cd {
    type: string
    sql: ${TABLE}.attribution_type_cd ;;
    hidden: yes
  }

  dimension: attribution_type_name {
    label: "Name"
    type: string
    sql: ${TABLE}.attribution_type_name ;;
  }
}
