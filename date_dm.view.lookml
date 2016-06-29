- view: date_dm
  sql_table_name: MAIN.DATE_DM
  fields:

  - dimension: cal_date_label
    type: string
    sql: ${TABLE}.CAL_DATE_LABEL
    hidden: true

  - dimension: cal_dt
    type: time
    convert_tz: false
    sql: ${TABLE}.CAL_DT

  - dimension: cal_itd_day_no
    type: number
    value_format: '0'
    sql: ${TABLE}.CAL_ITD_DAY_NO
    hidden: true

  - dimension: cal_itd_month_no
    type: number
    value_format: '0'
    sql: ${TABLE}.CAL_ITD_MONTH_NO
    hidden: true

  - dimension: cal_itd_quarter_no
    type: number
    sql: ${TABLE}.CAL_ITD_QUARTER_NO
    hidden: true

  - dimension: cal_itd_week_no
    type: number
    value_format: '0'
    sql: ${TABLE}.CAL_ITD_WEEK_NO
    hidden: true

  - dimension: cal_ly_date_sid
    type: string
    sql: ${TABLE}.CAL_LY_DATE_SID
    hidden: true

  - dimension: cal_month_day_no
    type: number
    value_format: '0'
    sql: ${TABLE}.CAL_MONTH_DAY_NO

  - dimension: cal_month_dt
    type: time
    convert_tz: false
    sql: ${TABLE}.CAL_MONTH_DT

  - dimension: cal_month_week_no
    type: number
    value_format: '0'
    sql: ${TABLE}.CAL_MONTH_WEEK_NO

  - dimension: cal_ptd_bt
    type: string
    sql: ${TABLE}.CAL_PTD_BT
    hidden: true

  - dimension: cal_ptd_label
    type: string
    sql: ${TABLE}.CAL_PTD_LABEL
    hidden: true

  - dimension: cal_quarter_day_no
    type: number
    sql: ${TABLE}.CAL_QUARTER_DAY_NO

  - dimension: cal_quarter_month_no
    type: number
    value_format: '0'
    sql: ${TABLE}.CAL_QUARTER_MONTH_NO

  - dimension: cal_quarter_week_no
    type: number
    value_format: '0'
    sql: ${TABLE}.CAL_QUARTER_WEEK_NO

  - dimension: cal_week_day_no
    type: number
    value_format: '0'
    sql: ${TABLE}.CAL_WEEK_DAY_NO

  - dimension: cal_week_ending_dt
    type: time
    convert_tz: false
    sql: ${TABLE}.CAL_WEEK_ENDING_DT

  - dimension: cal_weekday_fl
    type: string
    sql: ${TABLE}.CAL_WEEKDAY_FL

  - dimension: cal_weekend_fl
    type: string
    sql: ${TABLE}.CAL_WEEKEND_FL

  - dimension: cal_year_day_no
    type: number
    value_format: '0'
    sql: ${TABLE}.CAL_YEAR_DAY_NO

  - dimension: cal_year_month_label
    type: string
    sql: ${TABLE}.CAL_YEAR_MONTH_LABEL
    hidden: true

  - dimension: cal_year_month_no
    type: number
    value_format: '0'
    sql: ${TABLE}.CAL_YEAR_MONTH_NO

  - dimension: cal_year_no
    type: number
    value_format: '0'
    sql: ${TABLE}.CAL_YEAR_NO

  - dimension: cal_year_quarter_label
    type: string
    sql: ${TABLE}.CAL_YEAR_QUARTER_LABEL
    hidden: true

  - dimension: cal_year_quarter_no
    type: number
    value_format: '0'
    sql: ${TABLE}.CAL_YEAR_QUARTER_NO

  - dimension: cal_year_week_label
    type: string
    sql: ${TABLE}.CAL_YEAR_WEEK_LABEL
    hidden: true

  - dimension: cal_year_week_no
    type: number
    value_format: '0'
    sql: ${TABLE}.CAL_YEAR_WEEK_NO

  - dimension: date_sid
    type: string
    sql: ${TABLE}.DATE_SID
    hidden: true

  - dimension: holiday_name
    type: string
    sql: ${TABLE}.HOLIDAY_NAME
    hidden: true

  - dimension: iso_itd_day_no
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_ITD_DAY_NO
    hidden: true

  - dimension: iso_itd_month_no
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_ITD_MONTH_NO
    hidden: true

  - dimension: iso_itd_quarter_no
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_ITD_QUARTER_NO
    hidden: true

  - dimension: iso_itd_week_no
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_ITD_WEEK_NO
    hidden: true

  - dimension: iso_month_day_no
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_MONTH_DAY_NO

  - dimension: iso_month_dt
    type: time
    convert_tz: false
    sql: ${TABLE}.ISO_MONTH_DT

  - dimension: iso_month_week_no
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_MONTH_WEEK_NO

  - dimension: iso_ptd_bt
    type: string
    sql: ${TABLE}.ISO_PTD_BT
    hidden: true

  - dimension: iso_ptd_label
    type: string
    sql: ${TABLE}.ISO_PTD_LABEL
    hidden: true

  - dimension: iso_quarter_day_no
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_QUARTER_DAY_NO

  - dimension: iso_quarter_month_no
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_QUARTER_MONTH_NO

  - dimension: iso_quarter_week_no
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_QUARTER_WEEK_NO

  - dimension: iso_week_day_no
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_WEEK_DAY_NO

  - dimension: iso_week_ending_dt
    type: time
    convert_tz: false
    sql: ${TABLE}.ISO_WEEK_ENDING_DT

  - dimension: iso_year_day_no
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_YEAR_DAY_NO

  - dimension: iso_year_month_label
    type: string
    sql: ${TABLE}.ISO_YEAR_MONTH_LABEL
    hidden: true

  - dimension: iso_year_month_no
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_YEAR_MONTH_NO

  - dimension: iso_year_no
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_YEAR_NO

  - dimension: iso_year_quarter_label
    type: string
    sql: ${TABLE}.ISO_YEAR_QUARTER_LABEL
    hidden: true

  - dimension: iso_year_quarter_no
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_YEAR_QUARTER_NO

  - dimension: iso_year_week_label
    type: string
    sql: ${TABLE}.ISO_YEAR_WEEK_LABEL
    hidden: true

  - dimension: iso_year_week_no
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_YEAR_WEEK_NO
