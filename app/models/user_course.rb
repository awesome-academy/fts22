class UserCourse < ApplicationRecord
  belongs_to :user
  belongs_to :course
  enum status: {in_progress: 0, finished: 1, quit: 2}
  validate :user_cannot_in_multi_opened_course

  def user_cannot_in_multi_opened_course
    load_user
    number_of_unfinished_course =
      @user.courses.start.size + @user.courses.finished.size
    return unless number_of_unfinished_course.positive?
    errors.add :user_id, I18n.t("user_course.user_aready_in_opened_course")
  end

  private

  def load_user
    @user = User.find_by id: user_id
    return if @user
    errors.add :user_id, I18n.t("user_course.user_not_found")
  end
end
