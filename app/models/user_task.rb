class UserTask < ApplicationRecord
  belongs_to :user
  belongs_to :task
  enum status: {open: 0, in_progress: 1, done: 2}
end
