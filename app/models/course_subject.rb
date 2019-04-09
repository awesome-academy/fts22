class CourseSubject < ApplicationRecord
  belongs_to :course
  belongs_to :subject
  has_many :tasks, dependent: :destroy
end
