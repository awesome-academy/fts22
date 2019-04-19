class Course < ApplicationRecord
  has_many :user_courses, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
  has_many :users, through: :user_courses, source: :user
  has_many :subjects, through: :course_subjects
  scope :newest, ->{order created_at: :desc}
  validates :name, presence: true,
    length: {maximum: Settings.app.models.course.name_max_length}
  validates :start_date, presence: true,
    date: {before_or_equal_to: Time.now}
  validates :end_date, presence: true,
    date: {after: :start_date}
end
