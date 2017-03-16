view: referring_domain_dm {
  sql_table_name: rpt.main.referring_domain_dm ;;
  #-- pk

  #-- dimensions

  dimension: referring_domain_shk{
    type: string
    sql: ${TABLE}.referring_domain_shk ;;
    hidden: no
  }

  dimension: ref_domain {
    type: string
    sql: ${TABLE}.ref_domain ;;
  }

  dimension: domain_base {
    type: string
    sql: ${TABLE}.domain_base ;;
  }

  dimension: referrer_type_name {
    type: string
    sql: ${TABLE}.referrer_type_name ;;
    hidden: no
  }

  dimension: referrer_type {
    type: number
    sql: ${TABLE}.referrer_type_name ;;
    hidden: no
  }

}
