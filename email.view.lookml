- view: email
  sql_table_name: MAIN.EMAIL
  fields:

  - dimension: bu_id
    type: string
    # hidden: true
    sql: ${TABLE}.BU_ID

  - dimension: clicks_dt
    type: string
    sql: ${TABLE}.CLICKS_DT

  - dimension: clicks_link_content
    type: string
    sql: ${TABLE}.CLICKS_LINK_CONTENT

  - dimension: clicks_triggered_send_customer_key
    type: string
    sql: ${TABLE}.CLICKS_TRIGGERED_SEND_CUSTOMER_KEY

  - dimension: clicks_triggered_send_definition_object_id
    type: string
    sql: ${TABLE}.CLICKS_TRIGGERED_SEND_DEFINITION_OBJECT_ID

  - dimension: complaints_dt
    type: string
    sql: ${TABLE}.COMPLAINTS_DT

  - dimension: created_at
    type: string
    sql: ${TABLE}.CREATED_AT

  - dimension: email_domain
    type: string
    sql: ${TABLE}.EMAIL_DOMAIN

  - dimension: job_id
    type: string
    # hidden: true
    sql: ${TABLE}.JOB_ID

  - dimension: modified_at
    type: string
    sql: ${TABLE}.MODIFIED_AT

  - dimension: opens_dt
    type: string
    sql: ${TABLE}.OPENS_DT

  - dimension: opens_triggered_send_customer_key
    type: string
    sql: ${TABLE}.OPENS_TRIGGERED_SEND_CUSTOMER_KEY

  - dimension: opens_triggered_send_definition_object_id
    type: string
    sql: ${TABLE}.OPENS_TRIGGERED_SEND_DEFINITION_OBJECT_ID

  - dimension: sent_dt
    type: string
    sql: ${TABLE}.SENT_DT

  - dimension: subscriber_id
    type: string
    sql: ${TABLE}.SUBSCRIBER_ID

  - dimension: subscriber_key
    type: string
    sql: ${TABLE}.SUBSCRIBER_KEY

  - dimension: unsubscribe_dt
    type: string
    sql: ${TABLE}.UNSUBSCRIBE_DT

  - measure: count
    type: count
    drill_fields: [bu.bu_id, bu.bu_name, jobs.from_name, jobs.email_name, jobs.job_id]

