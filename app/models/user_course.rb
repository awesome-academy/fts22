class UserCourse < ApplicationRecord
  belongs_to :user
  belongs_to :course
  enum status: {in_progress: 0, finished: 1, quit: 2}
end
