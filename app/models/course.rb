class Course < ApplicationRecord
  has_many :user_courses, dependent: :destroy
  validates :name, presence: true,
    length: {maximum: Settings.app.models.course.name_max_length}
  validates :start_date, presence: true,
    date: {before_or_equal_to: Time.now}
  validates :end_date, presence: true,
    date: {after: :start_date}
end
