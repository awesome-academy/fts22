function openReportForm(updateUrl, status, description) {
  $('#taskReportForm').modal()
  $('#report').attr('action', updateUrl)
  $('#user_task_status').val(status)
  $('#user_task_short_description').val(description)
}

function openTaskEditForm(updateUrl, name, description) {
  $('#task-edit-form').modal()
  $('#edit-task-error').html('')
  $('#edit-task').attr('action', updateUrl)
  $('#edit_task_name').val(name)
  $('#edit_task_description').val(description)
}
