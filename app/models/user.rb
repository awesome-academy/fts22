class User < ApplicationRecord
  has_many :user_courses, dependent: :destroy
  has_many :course_supervisors, dependent: :destroy
  has_many :user_subjects, dependent: :destroy
  has_many :user_tasks, dependent: :destroy
  has_many :courses, through: :user_courses
  has_many :trainer_courses, through: :course_supervisors, source: :course
  has_many :subjects, through: :user_subjects
  has_many :tasks, through: :user_tasks
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
  enum role: {trainee: 0, admin: 1, trainer: 2}
  scope :except_user_id, ->(user_id){where.not id: user_id}

  def self.digest string
    BCrypt::Password.create(string, cost: User.get_cost)
  end

  def self.get_cost
    return BCrypt::Engine.min_cost if ActiveModel::SecurePassword.min_cost
    BCrypt::Engine.cost
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update remember_digest: User.digest(remember_token)
  end

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password? token
  end

  def forget
    update remember_digest: nil
  end
end
