label: "Budget"

connection: "edwrpt"

case_sensitive: no

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: mdbs_sales_channel_f {
  from: mdbs_sales_channel_f
  label: "Daily Summary Actual to Budget"
  view_label: "1) Measures"
  description: "Daily key metrics comparing budget with actuals."
  persist_for: "3 minutes"

  always_filter: {
    filters: {
      field: sales_channel_dm.sales_channel_name
      value: "InterweaveStore.com"
    }
  }

  join: budget_date_dm {
    from: date_dm
    view_label: "2) Date"
    sql_on: ${budget_date_dm.date_sid} = ${mdbs_sales_channel_f.date_sid} ;;
    type: inner
    relationship: many_to_one
  }

  join: sales_channel_dm {
    view_label: "3) Sales Channel"
    sql_on: ${sales_channel_dm.sales_channel_shk} = ${mdbs_sales_channel_f.sales_channel_shk} ;;
    type: inner
    relationship: many_to_one
  }
}
