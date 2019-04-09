class CourseSubjectTask < ApplicationRecord
  belongs_to :course_subject
  belongs_to :task
end
