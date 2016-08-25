- view: date_dm
  sql_table_name: RPT.MAIN.DATE_DM
  fields:

  - dimension: cal_date_label
    group_label: 'Calendar'
    type: string
    sql: ${TABLE}.CAL_DATE_LABEL
    can_filter: false

  - dimension: cal_dt
    label: 'Cal Date'
    type: date_date
    sql: ${TABLE}.cal_dt

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
    type: date_date
    sql: ${TABLE}.cal_month_dt
    hidden: true

  - dimension: cal_month_label
    group_label: 'Calendar'
    type: string
    sql: ${TABLE}.CAL_MONTH_LABEL
    can_filter: false

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
    can_filter: false

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

  - dimension: cal_year_dt
    label: 'Cal Year Date'
    group_label: 'Calendar'
    type: date_date
    sql: date_trunc( 'year', ${TABLE}.cal_dt )

  - dimension: cal_year_day_no
    group_label: 'Calendar'
    type: number
    value_format: '0'
    sql: ${TABLE}.CAL_YEAR_DAY_NO

  - dimension: cal_year_month_dt
    label: 'Cal Year Month Date'
    group_label: 'Calendar'
    type: date_date
    sql: ${TABLE}.cal_year_month_dt

  - dimension: cal_year_month_no
    group_label: 'Calendar'
    type: number
    value_format: '0'
    sql: ${TABLE}.CAL_YEAR_MONTH_NO
    drill_fields: [cal_year_day_no,cal_dt]

  - dimension: cal_year_no
    group_label: 'Calendar'
    type: number
    value_format: '0'
    sql: ${TABLE}.CAL_YEAR_NO
    drill_fields: [cal_year_quarter_no,cal_year_month_no,cal_year_day_no,cal_dt]

  - dimension: cal_year_quarter_dt
    label: 'Cal Year Quarter Date'
    group_label: 'Calendar'
    type: date_date
    sql: ${TABLE}.cal_year_quarter_dt

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
    drill_fields: [cal_year_month_no,cal_year_day_no,cal_dt]

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
    label: 'ISO Month Date'
    group_label: 'ISO'
    type: date_date
    sql: ${TABLE}.ISO_MONTH_DT
    hidden: false

  - dimension: iso_month_label
    label: 'ISO Month Label'
    group_label: 'ISO'
    type: string
    sql: ${TABLE}.ISO_MONTH_LABEL
    hidden: false
    can_filter: false

  - dimension: iso_month_week_no
    group_label: 'ISO'
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_MONTH_WEEK_NO
    hidden: true

  - dimension: iso_ptd_bt
    group_label: 'ISO'
    type: number
    sql: ${TABLE}.ISO_PTD_BT
    hidden: true
    
  - dimension: iso_ptd_label
    label: 'ISO Period-to-Date'
    group_label: 'ISO'
    type: string
    sql: ${TABLE}.ISO_PTD_LABEL
    hidden: false

  - dimension: iso_quarter_dt
    label: 'ISO Quarter Date'
    group_label: 'ISO'
    type: date_date
    sql: ${TABLE}.ISO_QUARTER_DT
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
    label: 'ISO Week Date'
    group_label: 'ISO'
    type: date_date
    sql: ${TABLE}.ISO_WEEK_DT
    hidden: false

  - dimension: iso_year_dt
    label: 'ISO Year Date'
    group_label: 'ISO'
    type: date_date
    sql: ${TABLE}.ISO_YEAR_DT
    hidden: false

  - dimension: iso_year_day_no
    label: 'ISO Year Day No'
    group_label: 'ISO'
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_YEAR_DAY_NO

  - dimension: iso_year_month_dt
    label: 'ISO Year Month Date'
    group_label: 'ISO'
    type: date_date
    sql: ${TABLE}.iso_year_month_dt
    
  
  - dimension: iso_year_month_no
    label: 'ISO Year Month No'
    group_label: 'ISO'
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_YEAR_MONTH_NO
    drill_fields: [iso_year_week_no,iso_year_day_no,cal_dt]

  - dimension: iso_year_no
    label: 'ISO Year No'
    group_label: 'ISO'
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_YEAR_NO
    drill_fields: [iso_year_quarter_no,iso_year_month_no,iso_year_week_no,iso_year_day_no,cal_dt]

  - dimension: iso_year_quarter_dt
    label: 'ISO Year Quarter Date'
    group_label: 'ISO'
    type: date_date
    sql: ${TABLE}.iso_year_quarter_dt

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
    drill_fields: [iso_year_month_no,iso_year_week_no,iso_year_day_no,cal_dt]

  - dimension: iso_year_week_dt
    label: 'ISO Year Week Date'
    group_label: 'ISO'
    type: date_date
    sql: ${TABLE}.iso_year_week_dt

  - dimension: iso_week_label
    label: 'ISO Week Label'
    group_label: 'ISO'
    type: string
    sql: ${TABLE}.ISO_WEEK_LABEL
    hidden: false
    can_filter: false

  - dimension: iso_year_week_no
    label: 'ISO Year Week No'
    group_label: 'ISO'
    type: number
    value_format: '0'
    sql: ${TABLE}.ISO_YEAR_WEEK_NO
    drill_fields: [iso_year_day_no,cal_dt]
