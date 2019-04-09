class User < ApplicationRecord
  has_many :user_courses, dependent: :destroy
  has_many :user_subjects, dependent: :destroy
  has_many :user_tasks, dependent: :destroy
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_secure_password
  validates :email, presence: true,
    length: {maximum: Settings.app.models.user.email_max_length},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :name, presence: true,
    length: {maximum: Settings.app.models.user.name_max_length}
  validates :password, presence: true,
    length: {minimum: Settings.app.models.user.password_max_length},
    allow_nil: true
end
