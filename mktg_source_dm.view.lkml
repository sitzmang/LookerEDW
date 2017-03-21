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

  dimension: medium_cd {
    label: "Medium"
    description: "Value in utm_medium."
    type: string
    sql: ${TABLE}.medium_cd ;;
  }

  dimension: source_cd {
    label: "Source"
    description: "Value in utm_source."
    type: string
    sql: ${TABLE}.source_cd ;;
  }

  dimension: campaign_cd {
    label: "Campaign"
    description: "Value in utm_campaign."
    type: string
    sql: ${TABLE}.campaign_cd ;;
  }

  dimension: mktg_source_shk {
    type: string
    sql: ${TABLE}.mktg_source_shk ;;
    hidden: yes
  }
}
