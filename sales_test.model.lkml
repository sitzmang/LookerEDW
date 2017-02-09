label: "Sales_Test"

connection: "edwrpt"

case_sensitive: no

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: order_line_f {
  from: order_line_f_test
  label: "Order Line Sales"
  view_label: "1) Measures"
  persist_for: "8 hours"
  always_join: [order_line_status_dm]

  always_filter: {
    filters: {
      field: order_line_status_dm.master_line_status_name
      value: "Demand"
    }
  }

  join: system_dm {
    view_label: "System"
    sql_on: ${system_dm.system_sid} = ${order_line_f.system_sid} ;;
    type: inner
    relationship: many_to_one
  }

  join: order_date_dm {
    from: date_dm
    view_label: "2) Date Ordered"
    sql_on: ${order_date_dm.date_sid} = ${order_line_f.order_date_sid} ;;
    type: inner
    relationship: many_to_one
  }

  join: ship_date_dm {
    from: date_dm
    view_label: "3) Date Shipped"
    sql_on: ${ship_date_dm.date_sid} = ${order_line_f.ship_date_sid} ;;
    type: inner
    relationship: many_to_one
  }

  join: sales_channel_dm {
    view_label: "4) Sales Channel"
    sql_on: ${sales_channel_dm.sales_channel_shk} = ${order_line_f.sales_channel_shk} ;;
    type: inner
    relationship: many_to_one
  }

  join: product_dm {
    view_label: "Product"
    sql_on: ${product_dm.product_shk} = ${order_line_f.product_shk} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: order_line_status_dm {
    view_label: "Order Line Status"
    sql_on: ${order_line_status_dm.order_line_status_shk} = ${order_line_f.order_line_status_shk} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: billing_location_dm {
    from: location_dm
    view_label: "Location Billing"
    sql_on: ${billing_location_dm.state_cd_shk} = ${order_line_f.billing_state_shk} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: customer_dm {
    view_label: "Customer"
    sql_on: ${customer_dm.customer_shk} = ${order_line_f.customer_shk} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: order_dm {
    view_label: "Order"
    sql_on: ${order_dm.order_shk} = ${order_line_f.order_shk} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: order_line_dm {
    view_label: "Order Line"
    sql_on: ${order_line_dm.order_line_shk} = ${order_line_f.order_line_shk} ;;
    type: left_outer
    relationship: many_to_one
  }
}

explore: xds_sales_channel_f {
  label: "Adobe"
  persist_for: "8 hours"

  join: order_date_dm {
    from: date_dm
    view_label: "2) Date Visited"
    sql_on: ${order_date_dm.date_sid} = ${xds_sales_channel_f.request_date_sid} ;;
    type: inner
    relationship: many_to_one
  }

  join: sales_channel_dm {
    view_label: "4) Sales Channel"
    sql_on: ${sales_channel_dm.sales_channel_shk} = ${xds_sales_channel_f.sales_channel_shk} ;;
    type: inner
    relationship: many_to_one
  }
      }
