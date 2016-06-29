- view: jobs
  sql_table_name: MAIN.JOBS
  fields:

  - dimension: job_id
    primary_key: true
    type: string
    sql: ${TABLE}.JOB_ID

  - dimension: bu
    type: string
    sql: ${TABLE}.BU

  - dimension: bu_id
    type: string
    # hidden: true
    sql: ${TABLE}.BU_ID

  - dimension: created_at
    type: string
    sql: ${TABLE}.CREATED_AT

  - dimension: email_id
    type: string
    sql: ${TABLE}.EMAIL_ID

  - dimension: email_name
    type: string
    sql: ${TABLE}.EMAIL_NAME

  - dimension: email_subject
    type: string
    sql: ${TABLE}.EMAIL_SUBJECT

  - dimension: event_dt
    type: string
    sql: ${TABLE}.EVENT_DT

  - dimension: event_id
    type: string
    sql: ${TABLE}.EVENT_ID

  - dimension: from_email
    type: string
    sql: ${TABLE}.FROM_EMAIL

  - dimension: from_name
    type: string
    sql: ${TABLE}.FROM_NAME

  - dimension: send_type
    type: string
    sql: ${TABLE}.SEND_TYPE

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - job_id
    - from_name
    - email_name
    - bu.bu_id
    - bu.bu_name
    - email.count

