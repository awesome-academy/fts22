class Task < ApplicationRecord
  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks
  belongs_to :course_subject, dependent: :destroy
end
