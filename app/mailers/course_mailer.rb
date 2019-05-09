class CourseMailer < ApplicationMailer
  def course_started_notify course, email
    @course = course
    mail to: email, subject: course.name
  end

  def trainee_daily_report user_tasks, email, course_name
    @user_tasks = user_tasks
    mail to: email, subject: course_name
  end
end
