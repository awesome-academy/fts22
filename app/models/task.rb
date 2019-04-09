class Task < ApplicationRecord
  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks
  belongs_to :course_subject, dependent: :destroy
  scope(:of_user,
    lambda do |user_id|
      joins(:user_tasks).where "user_tasks.user_id = ?", user_id
    end)
end
