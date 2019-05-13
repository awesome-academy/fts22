class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  has_many :user_courses, dependent: :destroy
  has_many :course_supervisors, dependent: :destroy
  has_many :user_subjects, dependent: :destroy
  has_many :user_tasks, dependent: :destroy
  has_many :courses, through: :user_courses
  has_many :trainer_courses, through: :course_supervisors, source: :course
  has_many :subjects, through: :user_subjects
  has_many :tasks, through: :user_tasks
  enum role: {trainee: 0, admin: 1, trainer: 2}
  scope :except_user_id, ->(user_id){where.not id: user_id}
  scope :newest, ->{order created_at: :desc}

  def send_created_email
    UserMailer.user_created(self).deliver_later
  end

  def send_assigned_course_email course
    UserMailer.user_assigned_to_course(self, course).deliver_now
  end
end
