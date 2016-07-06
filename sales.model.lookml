- connection: edwrpt

- include: '*.view.lookml'       # include all the views
- include: '*.dashboard.lookml'  # include all the dashboards


- explore: order_line_f
  label: 'Order Line Sales'
  view_label: '1) Order Line'
  persist_for: 12 hours
  joins:
    - join: date_dm
      view_label: 'Date Ordered'
      sql_on: ${date_dm.date_sid} = ${order_line_f.order_date_sid}
      type: inner
      relationship: many_to_one

    - join: ship_date_dm
      view_label: 'Date Shipped'
      sql_on: ${ship_date_dm.date_sid} = ${order_line_f.ship_date_sid}
      type: inner
      relationship: many_to_one

    - join: product_dm
      view_label: 'Product'
      sql_on: ${product_dm.product_shk} = ${order_line_f.product_shk}
      type: inner
      relationship: many_to_one

    - join: sales_channel_dm
      view_label: 'Sales Channel'
      sql_on: ${sales_channel_dm.sales_channel_shk} = ${order_line_f.sales_channel_shk}
      type: inner
      relationship: many_to_one

    - join: order_line_status_dm
      view_label: 'Order Line Status'
      sql_on: ${order_line_status_dm.order_line_status_shk} = ${order_line_f.order_line_status_shk}
      type: inner
      relationship: many_to_one

    - join: billing_state_dm
      view_label: 'Billing State'
      sql_on: ${billing_state_dm.state_cd_shk} = ${order_line_f.billing_state_shk}
      type: inner
      relationship: many_to_one
