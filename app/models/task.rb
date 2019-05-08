class Task < ApplicationRecord
  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks
  belongs_to :course_subject
  scope :order_by_name, ->{order :name}
  scope :except_task_ids, ->(task_ids){where.not id: task_ids}
  scope(:by_course_subject_id, lambda do |course_subject_id|
    where course_subject_id: course_subject_id
  end)
  scope(:of_user,
    lambda do |user_id|
      joins(:user_tasks).where "user_tasks.user_id = ?", user_id
    end)
  validates :name, presence: true,
    length: {maximum: Settings.app.models.course.name_max_length}
  validates :description, presence: true,
    length: {maximum: Settings.app.models.course.name_max_length}
end
