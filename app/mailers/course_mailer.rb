class CourseMailer < ApplicationMailer
  def course_started_notify course, email
    @course = course
    mail to: email, subject: course.name
  end
end
