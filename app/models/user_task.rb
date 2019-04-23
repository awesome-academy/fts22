class UserTask < ApplicationRecord
  belongs_to :user
  belongs_to :task
  enum status: {open: 0, in_progress: 1, done: 2}
  scope :by_tasks_id, ->(tasks_id){where task_id: tasks_id}
end
