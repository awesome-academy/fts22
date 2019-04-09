class Task < ApplicationRecord
  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks
  belongs_to :subject
  scope(:of_user,
    lambda do |user_id|
      joins(:user_tasks).where "user_tasks.user_id in (?)", user_id
    end)
  scope :newest, ->{order created_at: :desc}
  validates :name, presence: true,
    length: {maximum: Settings.app.models.subject.name_max_length}
  validates :description, presence: true,
    length: {maximum: Settings.app.models.subject.description_max_length}
end
