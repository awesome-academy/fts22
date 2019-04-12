class Task < ApplicationRecord
  has_many :user_tasks, dependent: :destroy
  has_many :course_subject_tasks, dependent: :destroy
end
