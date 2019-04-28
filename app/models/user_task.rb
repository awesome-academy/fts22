class UserTask < ApplicationRecord
  belongs_to :user
  belongs_to :task
  scope :by_tasks_id, ->(tasks_id){where task_id: tasks_id}
  scope :newest, ->{order created_at: :desc}
  enum status: {open: 0, in_progress: 1, ready: 2, commented: 3, done: 4}
  validates :status, presence: true
  validates :short_description, presence: true, on: :update
end
