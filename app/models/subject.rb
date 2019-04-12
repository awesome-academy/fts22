class Subject < ApplicationRecord
  has_many :course_subjects, dependent: :destroy
  has_many :user_subjects, dependent: :destroy
end
