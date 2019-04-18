module SubjectsHelper
  def load_task user_task
    user_task.task
  end

  def add_class_task_status user_task
    case user_task.status
    when "in_progress"
      {class: "primary", content: t(".in_progress")}
    when "ready"
      {class: "warning", content: t(".ready")}
    when "commented"
      {class: "danger", content: t(".comented")}
    when "done"
      {class: "success", content: t(".done")}
    else
      {
        class: Settings.app.tasks.status_default_css_class,
        content: Settings.app.tasks.default_status_content
      }
    end
  end

  def trainee_status_options
    UserTask.statuses.except(:done, :commented).keys
  end
end
