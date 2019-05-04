class Task < ApplicationRecord
  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks
  belongs_to :course_subject
  scope :order_by_name, ->{order :name}
  scope(:of_user,
    lambda do |user_id|
      joins(:user_tasks).where "user_tasks.user_id = ?", user_id
    end)
  validates :name, presence: true,
    length: {maximum: Settings.app.models.course.name_max_length}
  validates :description, presence: true,
    length: {maximum: Settings.app.models.course.name_max_length}
end
