view: referring_domain_dm {
  sql_table_name: rpt.main.referring_domain_dm ;;
  #-- pk

  #-- dimensions

  dimension: referring_domain_shk{
    type: string
    sql: ${TABLE}.referring_domain_type_l_shk ;;
    hidden: yes
  }

  dimension: referring_domain_str {
    label: "Domain (full)"
    description: "Full domain of referrer."
    type: string
    sql: ${TABLE}.referring_domain_str ;;
  }

  dimension: ref_domain_base {
    label: "Domain (base)"
    description: "Base domain of referrer."
    type: string
    sql: ${TABLE}.referring_domain_base_str ;;
  }

  dimension: referrer_type_name {
    label: "Domain Type"
    description: "Type classification for the referring domain."
    type: string
    sql: ${TABLE}.referrer_type_name ;;
    hidden: no
  }

  dimension: referrer_type_cd {
    type: number
    sql: ${TABLE}.referrer_type ;;
    hidden: yes
  }

}
