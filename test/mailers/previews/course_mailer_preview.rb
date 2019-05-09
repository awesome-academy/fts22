# Preview all emails at http://localhost:3000/rails/mailers/course_mailer
class CourseMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/course_mailer/course_started_notify
  def course_started_notify
    CourseMailer.course_started_notify
  end
end
