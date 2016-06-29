- view: dim_date
  sql_table_name: MAIN.DIM_DATE
  fields:

  - dimension: day_name
    type: string
    sql: ${TABLE}.DAY_NAME

  - dimension: day_of_month
    type: string
    sql: ${TABLE}.DAY_OF_MONTH

  - dimension: day_of_week
    type: string
    sql: ${TABLE}.DAY_OF_WEEK

  - dimension: day_of_year
    type: string
    sql: ${TABLE}.DAY_OF_YEAR

  - dimension_group: daydate
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.DAYDATE

  - dimension: full_date_name
    type: string
    sql: ${TABLE}.FULL_DATE_NAME

  - dimension: month
    type: string
    sql: ${TABLE}.MONTH

  - dimension_group: month_first
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.MONTH_FIRST_DATE

  - dimension_group: month_last
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.MONTH_LAST_DATE

  - dimension: month_of_year
    type: string
    sql: ${TABLE}.MONTH_OF_YEAR

  - dimension: quarter
    type: string
    sql: ${TABLE}.QUARTER

  - dimension_group: quarter_first
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.QUARTER_FIRST_DATE

  - dimension_group: quarter_last
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.QUARTER_LAST_DATE

  - dimension: quarter_name
    type: string
    sql: ${TABLE}.QUARTER_NAME

  - dimension_group: week_first
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.WEEK_FIRST_DATE

  - dimension_group: week_last
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.WEEK_LAST_DATE

  - dimension: weekend_or_weekday
    type: string
    sql: ${TABLE}.WEEKEND_OR_WEEKDAY

  - dimension: year
    type: string
    sql: ${TABLE}.YEAR

  - dimension: year_month
    type: string
    sql: ${TABLE}.YEAR_MONTH

  - dimension: year_quarter
    type: string
    sql: ${TABLE}.YEAR_QUARTER

  - dimension: yyyymmdd
    type: string
    sql: ${TABLE}.YYYYMMDD

  - measure: count
    type: count
    drill_fields: [full_date_name, day_name, quarter_name]

