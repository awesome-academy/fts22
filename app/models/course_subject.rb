class CourseSubject < ApplicationRecord
  belongs_to :course
  belongs_to :subject
  has_many :tasks
  scope :by_course_id, ->(course_id){where course_id: course_id}
  scope :sorted_by_date, ->{order :start_date, :end_date}
  validates :start_date, presence: true,
    date: {after_or_equal_to: Time.now}
  validates :end_date, presence: true,
    date: {after: :start_date}
end
