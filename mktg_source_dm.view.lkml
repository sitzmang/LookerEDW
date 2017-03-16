view: mktg_source_dm {
  sql_table_name: rpt.main.mktg_source_dm ;;
  #-- pk

  #-- dimensions

  dimension: utm_medium {
    type: string
    sql: ${TABLE}.utm_medium ;;
  }

  dimension: utm_source {
    type: string
    sql: ${TABLE}.utm_source ;;
  }

  dimension: utm_campaign {
    type: string
    sql: ${TABLE}.utm_campaign ;;
  }

  dimension: mktg_source_shk {
    type: string
    sql: ${TABLE}.mktg_source_shk ;;
    hidden: no
  }
}
