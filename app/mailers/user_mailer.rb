class UserMailer < ApplicationMailer
  def user_created user
    @user = user
    mail to: user.email, subject: t("mailer.user.user_created_subject")
  end

  def user_assigned_to_course user, course
    @course = course
    @user = user
    mail to: user.email, subject: course.name
  end
end
