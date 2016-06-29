- connection: edwrpt

- include: '*.view.lookml'       # include all the views
- include: '*.dashboard.lookml'  # include all the dashboards


- explore: order_line_f
  label: 'Demand Sales'
  view_label: '1) Order Line'
  persist_for: 12 hours
  joins:
    - join: date_dm
      view_label: 'Order Date'
      sql_on: ${date_dm.date_sid} = ${order_line_f.date_sid}
      type: inner
      relationship: many_to_one

    - join: product_dm
      view_label: 'Product'
      sql_on: ${product_dm.src_product_id} = ${order_line_f.src_product_id}
      type: inner
      relationship: many_to_one

    - join: sales_channel_dm
      view_label: 'Sales Channel'
      sql_on: ${sales_channel_dm.sales_channel_cd} = ${order_line_f.sales_channel_cd}
      type: inner
      relationship: many_to_one
