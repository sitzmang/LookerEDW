- label:      'Sales'
- connection: edwrpt

- include: '*.view.lookml'       # include all the views
- include: '*.dashboard.lookml'  # include all the dashboards


- explore: order_line_f
  label: 'Order Line Sales'
  view_label: '1) Measures'
  persist_for: 12 hours
  always_join: [order_line_status_dm]
  always_filter:
    order_line_status_dm.master_line_status_cd: 'DMND'
  joins:
    - join: system_dm
      view_label: 'System'
      sql_on: ${system_dm.system_sid} = ${order_line_f.system_sid}
      type: inner
      relationship: many_to_one

    - join: order_date_dm
      from: date_dm
      view_label: '2) Date Ordered'
      sql_on: ${order_date_dm.date_sid} = ${order_line_f.order_date_sid}
      type: inner
      relationship: many_to_one

    - join: ship_date_dm
      from: date_dm
      view_label: '3) Date Shipped'
      sql_on: ${ship_date_dm.date_sid} = ${order_line_f.ship_date_sid}
      type: inner
      relationship: many_to_one

    - join: sales_channel_dm
      view_label: '4) Sales Channel'
      sql_on: ${sales_channel_dm.sales_channel_shk} = ${order_line_f.sales_channel_shk}
      type: left_outer
      relationship: many_to_one

    - join: product_dm
      view_label: 'Product'
      sql_on: ${product_dm.product_shk} = ${order_line_f.product_shk}
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

    - join: customer_dm
      view_label: 'Customer'
      sql_on: ${customer_dm.customer_shk} = ${order_line_f.customer_shk}
      type: inner
      relationship: many_to_one

- explore: order_line_f_tyly
  label: 'Order Line Sales TYLY'
  view_label: '1) Measures'
  persist_for: 12 hours
  always_join: [order_line_status_dm]
  always_filter:
    order_line_status_dm.master_line_status_cd: 'DMND'
  joins:
    - join: order_date_dm
      from: date_dm
      view_label: '2) Date Ordered'
      sql_on: ${order_date_dm.date_sid} = ${order_line_f_tyly.order_date_sid}
      type: inner
      relationship: many_to_one

    - join: ship_date_dm
      from: date_dm
      view_label: '3) Date Shipped'
      sql_on: ${ship_date_dm.date_sid} = ${order_line_f_tyly.ship_date_sid}
      type: inner
      relationship: many_to_one

    - join: sales_channel_dm
      view_label: '4) Sales Channel'
      sql_on: ${sales_channel_dm.sales_channel_shk} = ${order_line_f_tyly.sales_channel_shk}
      type: left_outer
      relationship: many_to_one

    - join: product_dm
      view_label: 'Product'
      sql_on: ${product_dm.product_shk} = ${order_line_f_tyly.product_shk}
      type: inner
      relationship: many_to_one

    - join: order_line_status_dm
      view_label: 'Order Line Status'
      sql_on: ${order_line_status_dm.order_line_status_shk} = ${order_line_f_tyly.order_line_status_shk}
      type: inner
      relationship: many_to_one

    - join: billing_state_dm
      view_label: 'Billing State'
      sql_on: ${billing_state_dm.state_cd_shk} = ${order_line_f_tyly.billing_state_shk}
      type: inner
      relationship: many_to_one

    - join: customer_dm
      view_label: 'Customer'
      sql_on: ${customer_dm.customer_shk} = ${order_line_f_tyly.customer_shk}
      type: inner
      relationship: many_to_one

    - join: tyly_dm
      view_label: 'TY vs LY'
      sql_on: ${tyly_dm.tyly_sid} = ${order_line_f_tyly.tyly_sid}
      type: inner
      relationship: many_to_one
