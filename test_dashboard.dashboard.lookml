- dashboard: test_dashboard
  title: Test Dashboard
  layout: tile
  tile_size: 100

  filters:

  elements:
    - name: add_a_unique_name_1487346519
      title: Untitled Visualization
      type: looker_line
      model: sales_test
      explore: dds_sales_channel_f
      dimensions: [visit_date_dm.cal_dt]
      fill_fields: [visit_date_dm.cal_dt]
      measures: [dds_sales_channel_f.page_cnt]
      filters:
        visit_date_dm.cal_dt: 30 days
        sales_channel_dm.sales_channel_name: InterweaveStore.com
      sorts: [visit_date_dm.cal_dt desc]
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
