name: First LookML Dashboard
title: Untitled Visualization
type: looker_column
model: sales_test
explore: dds_sales_channel_f
dimensions: [visit_date_dm.cal_dt]
fill_fields: [visit_date_dm.cal_dt]
measures: [dds_sales_channel_f.visit_cnt]
filters:
  visit_date_dm.cal_dt: 30 days
  sales_channel_dm.sales_channel_name: InterweaveStore.com
sorts: [visit_date_dm.cal_dt]
limit: '500'
column_limit: '50'
query_timezone: America/Los_Angeles
stacking: ''
show_value_labels: false
label_density: 25
legend_position: center
x_axis_gridlines: false
y_axis_gridlines: true
show_view_names: true
limit_displayed_rows: false
y_axis_combined: true
show_y_axis_labels: true
show_y_axis_ticks: true
y_axis_tick_density: default
y_axis_tick_density_custom: 5
show_x_axis_label: true
show_x_axis_ticks: true
x_axis_scale: auto
y_axis_scale_mode: linear
ordering: none
show_null_labels: false
show_totals_labels: false
show_silhouette: false
totals_color: "#808080"
