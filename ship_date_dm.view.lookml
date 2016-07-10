- view: ship_date_dm
  sql_table_name: MAIN.DATE_DM
  fields:

  - dimension: cal_date_label
    group_label: 'Calendar'
    type: string
    sql: ${TABLE}.CAL_DATE_LABEL

  - dimension: cal_dt
    label: 'Cal Date'
    group_label: 'Calendar'
    type: date_date
    sql: ${TABLE}.CAL_DT

  - dimension: cal_itd_day_no
    group_label: 'Calendar'
    type: number
    value_format: '0'
    sql: ${TABLE}.CAL_ITD_DAY_NO
    hidden: true

  - dimension: cal_itd_month_no
    group_label: 'Calendar'
    type: number
    value_format: '0'
    sql: ${TABLE}.CAL_ITD_MONTH_NO
    hidden: true

  - dimension: cal_itd_quarter_no
    group_label: 'Calendar'
    type: number
    sql: ${TABLE}.CAL_ITD_QUARTER_NO
    hidden: true

  - dimension: cal_ly_date_sid
    type: string
    sql: ${TABLE}.CAL_LY_DATE_SID
    hidden: true

  - dimension: cal_month_day_no
    group_label: 'Calendar'
    type: number
    value_format: '0'
    sql: ${TABLE}.CAL_MONTH_DAY_NO
    hidden: true

  - dimension: cal_month_dt
    group_label: 'Calendar'
    type: time
    convert_tz: false
    sql: ${TABLE}.CAL_MONTH_DT
    hidden: true

  - dimension: cal_month_label
    group_label: 'Calendar'
    type: string
    sql: ${TABLE}.CAL_MONTH_LABEL

  - dimension: cal_ptd_bt
    group_label: 'Calendar'
    type: string
    sql: ${TABLE}.CAL_PTD_BT
    hidden: true

  - dimension: cal_ptd_label
    label: 'Cal Period-to-Date'
    group_label: 'Calendar'
    type: string
    sql: ${TABLE}.CAL_PTD_LABEL
    hidden: false

  - dimension: cal_quarter_day_no
    group_label: 'Calendar'
    type: number
    sql: ${TABLE}.CAL_QUARTER_DAY_NO
    hidden: true

  - dimension: cal_quarter_month_no
    group_label: 'Calendar'
    type: number
    value_format: '0'
    sql: ${TABLE}.CAL_QUARTER_MONTH_NO
    hidden: true

  - dimension: cal_week_day_no
    group_label: 'Calendar'
    value_format: '0'
    sql: ${TABLE}.CAL_WEEK_DAY_NO

  - dimension: cal_weekday_fl
    group_label: 'Calendar'
    type: string
    sql: ${TABLE}.CAL_WEEKDAY_FL
    hidden: true

  - dimension: cal_weekend_fl
    group_label: 'Calendar'
    type: string
    sql: ${TABLE}.CAL_WEEKEND_FL
    hidden: true

  - dimension: cal_year_day_no
    group_label: 'Calendar'
    type: number
    value_format: '0'
    sql: ${TABLE}.CAL_YEAR_DAY_NO

  - dimension: cal_year_month_no
    group_label: 'Calendar'
    type: number
    value_format: '0'
    sql: ${TABLE}.CAL_YEAR_MONTH_NO

  - dimension: cal_year_no
    group_label: 'Calendar'
    type: number
    value_format: '0'
    sql: ${TABLE}.CAL_YEAR_NO

  - dimension: cal_year_quarter_label
    group_label: 'Calendar'
    type: string
    sql: ${TABLE}.CAL_YEAR_QUARTER_LABEL
    hidden: true

  - dimension: cal_year_quarter_no
    group_label: 'Calendar'
    type: number
    value_format: '0'
    sql: ${TABLE}.CAL_YEAR_QUARTER_NO

  - dimension: date_sid
    type: string
    sql: ${TABLE}.DATE_SID
    hidden: true

  - dimension: holiday_name
    group_label: 'Calendar'
    type: string
    sql: ${TABLE}.HOLIDAY_NAME
    hidden: true

  - dimension: iso_itd_day_no
    group_label: 'ISO'
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_ITD_DAY_NO
    hidden: true

  - dimension: iso_itd_month_no
    group_label: 'ISO'
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_ITD_MONTH_NO
    hidden: true

  - dimension: iso_itd_quarter_no
    group_label: 'ISO'
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_ITD_QUARTER_NO
    hidden: true

  - dimension: iso_itd_week_no
    group_label: 'ISO'
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_ITD_WEEK_NO
    hidden: true

  - dimension: iso_month_day_no
    group_label: 'ISO'
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_MONTH_DAY_NO
    hidden: true

  - dimension: iso_month_dt
    group_label: 'ISO'
    type: time
    convert_tz: false
    sql: ${TABLE}.ISO_MONTH_DT
    hidden: true

  - dimension: iso_month_label
    label: 'ISO Month Label'
    group_label: 'ISO'
    type: string
    sql: ${TABLE}.ISO_MONTH_LABEL
    hidden: false

  - dimension: iso_month_week_no
    group_label: 'ISO'
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_MONTH_WEEK_NO
    hidden: true

  - dimension: iso_ptd_bt
    group_label: 'ISO'
    type: string
    sql: ${TABLE}.ISO_PTD_BT
    hidden: true

  - dimension: iso_ptd_label
    label: 'ISO Period-to-Date'
    group_label: 'ISO'
    type: string
    sql: ${TABLE}.ISO_PTD_LABEL
    hidden: false

  - dimension: iso_quarter_day_no
    group_label: 'ISO'
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_QUARTER_DAY_NO
    hidden: true

  - dimension: iso_quarter_month_no
    group_label: 'ISO'
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_QUARTER_MONTH_NO
    hidden: true

  - dimension: iso_quarter_week_no
    group_label: 'ISO'
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_QUARTER_WEEK_NO
    hidden: true

  - dimension: iso_week_day_no
    group_label: 'ISO'
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_WEEK_DAY_NO
    hidden: true

  - dimension: iso_week_dt
    group_label: 'ISO'
    type: time
    convert_tz: false
    sql: ${TABLE}.ISO_WEEK_ENDING_DT
    hidden: true

  - dimension: iso_year_day_no
    label: 'ISO Year Day No'
    group_label: 'ISO'
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_YEAR_DAY_NO

  - dimension: iso_year_month_no
    label: 'ISO Year Month No'
    group_label: 'ISO'
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_YEAR_MONTH_NO

  - dimension: iso_year_no
    label: 'ISO Year No'
    group_label: 'ISO'
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_YEAR_NO

  - dimension: iso_year_quarter_label
    group_label: 'ISO'
    type: string
    sql: ${TABLE}.ISO_YEAR_QUARTER_LABEL
    hidden: true

  - dimension: iso_year_quarter_no
    label: 'ISO Year Quarter No'
    group_label: 'ISO'
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_YEAR_QUARTER_NO

  - dimension: iso_year_week_label
    group_label: 'ISO'
    type: string
    sql: ${TABLE}.ISO_YEAR_WEEK_LABEL
    hidden: true

  - dimension: iso_year_week_no
    label: 'ISO Year Week No'
    group_label: 'ISO'
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_YEAR_WEEK_NO
