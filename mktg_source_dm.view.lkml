view: mktg_source_dm {
  sql_table_name: rpt.main.mktg_source_dm ;;
  #-- pk

  #-- dimensions

  dimension: mktg_channel_group_name{
    label: "Marketing Channel"
    description: "Top-level marketing source rollup."
    type: string
    sql: ${TABLE}.mktg_channel_group_name ;;
  }

  dimension: mktg_src_medium {
    label: "Medium"
    description: "Value in utm_medium."
    type: string
    sql: ${TABLE}.utm_medium ;;
  }

  dimension: mktg_src_source {
    label: "Source"
    description: "Value in utm_source."
    type: string
    sql: ${TABLE}.utm_source ;;
  }

  dimension: mktg_src_campaign {
    label: "Campaign"
    description: "Value in utm_campaign."
    type: string
    sql: ${TABLE}.utm_campaign ;;
  }

  dimension: mktg_source_shk {
    type: string
    sql: ${TABLE}.mktg_source_shk ;;
    hidden: yes
  }
}
