class UserSubject < ApplicationRecord
  belongs_to :subject
  belongs_to :user
  enum status: {not_done: 0, done: 1}
end
