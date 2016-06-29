- connection: edwrpt

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: bu

- explore: dim_date

- explore: email
  joins:
    - join: bu
      type: left_outer 
      sql_on: ${email.bu_id} = ${bu.bu_id}
      relationship: many_to_one

    - join: jobs
      type: left_outer 
      sql_on: ${email.job_id} = ${jobs.job_id}
      relationship: many_to_one


- explore: jobs
  joins:
    - join: bu
      type: left_outer 
      sql_on: ${jobs.bu_id} = ${bu.bu_id}
      relationship: many_to_one


