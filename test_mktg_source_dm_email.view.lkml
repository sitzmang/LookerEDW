view: test_mktg_source_dm_email {
  sql_table_name: rpt.main.mktg_source_dm ;;
  #-- pk

  #-- dimensions

  dimension: mktg_channel_group_name{
    label: "Marketing Channel"
    description: "Top-level marketing source rollup."
    type: string
    sql: ${TABLE}.mktg_channel_group_name ;;
  }

  dimension: medium_name {
    label: "Medium"
    description: "Value in utm_medium."
    type: string
    sql: ${TABLE}.medium_name ;;
  }

  dimension: source_name {
    label: "Source"
    description: "Value in utm_source."
    type: string
    sql: ${TABLE}.source_name ;;
  }

  dimension: campaign_name {
    label: "Campaign"
    description: "Value in utm_campaign."
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: mktg_source_shk {
    type: string
    sql: ${TABLE}.mktg_source_shk ;;
    hidden: yes
  }
}
