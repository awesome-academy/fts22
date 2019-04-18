function openReportForm(updateUrl, status, description) {
  $('#taskReportForm').modal()
  $('#report').attr('action', updateUrl)
  $('#user_task_status').val(status)
  $('#user_task_short_description').val(description)
}
