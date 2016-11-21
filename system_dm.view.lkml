view: system_dm {
  sql_table_name: RPT.MAIN.SYSTEM_DM ;;
  #-- pk

  dimension: system_sid {
    type: string
    sql: ${TABLE}.SYSTEM_SID ;;
    hidden: yes
  }

  #-- pk

  dimension: system_cd {
    type: string
    sql: ${TABLE}.SYSTEM_CD ;;
    hidden: yes
  }

  dimension: system_name {
    type: string
    sql: ${TABLE}.SYSTEM_NAME ;;
  }
}
