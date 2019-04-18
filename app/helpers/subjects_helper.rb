module SubjectsHelper
  def load_task user_task
    user_task.task
  end

  def add_class_task_status user_task
    if user_task.open?
      return {
        class: Settings.app.tasks.status_default_css_class,
        content: Settings.app.tasks.default_status_content
      }
    end
    return {class: "primary", content: "In progress"} if user_task.in_progress?
    return {class: "warning", content: "Ready"} if user_task.ready?
    return {class: "danger", content: "Comented"} if user_task.commented?
    return {class: "success", content: "Done"} if user_task.done?
  end

  def trainee_status_options
    UserTask.statuses.except(:done, :commented).keys
  end
end
