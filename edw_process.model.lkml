label: "EDW Processes"

connection: "edwrpt"

case_sensitive: no

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: dw_process_instance_f {
  label: "EDW Processes"
  persist_for: "30 minutes"

  join: dw_process_dm {
    view_label: "DW Process DM"
    sql_on: ${dw_process_dm.process_sid} = ${dw_process_instance_f.process_sid} ;;
    type: inner
    relationship: many_to_one
  }

  join: process_start_date {
    from: date_dm
    view_label: "2) Date Process Started"
    sql_on: date_trunc(day,to_timestamp(${dw_process_instance_f.process_start_dt})) = ${process_start_date.cal_dt} ;;
    type: inner
    relationship: many_to_one
  }

  join: process_end_date {
    from: date_dm
    view_label: "3) Date Process Completed"
    sql_on: date_trunc(day,to_timestamp(${dw_process_instance_f.process_end_dt})) = ${process_end_date.cal_dt} ;;
    type: inner
    relationship: many_to_one
  }


}
