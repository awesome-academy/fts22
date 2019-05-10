class Course < ApplicationRecord
  has_many :user_courses, dependent: :destroy
  has_many :course_supervisors, dependent: :destroy
  has_many :users, through: :user_courses
  has_many :trainers, through: :course_supervisors, source: :user
  has_many :course_subjects, dependent: :destroy
  has_many :subjects, through: :course_subjects
  has_many :tasks, through: :course_subjects

  scope :newest, ->{order created_at: :desc}
  validates :name, presence: true,
    length: {maximum: Settings.app.models.course.name_max_length}
  validates :start_date, presence: true,
    date: {after_or_equal_to: Time.now - 1.day}
  validates :end_date, presence: true,
    date: {after: :start_date}
  enum status: {open: 0, start: 1, finished: 2}
  mount_uploader :image, ImageUploader

  def trainers_not_in_course
    User.except_user_id(course_supervisors.pluck(:user_id)).trainer
  end

  def trainees_not_in_course
    User.except_user_id(user_courses.pluck(:user_id)).trainee
  end

  def subjects_not_in_course
    Subject.except_subject_id course_subjects.pluck(:subject_id)
  end

  def subjects_already_in_course
    Subject.where id: course_subjects.pluck(:subject_id)
  end

  def notify_to_everyone
    users.each do |user|
      CourseMailer.delay.course_started_notify self, user.email
    end
    trainers.each do |trainer|
      CourseMailer.delay.course_started_notify self, trainer.email
    end
  end

  def send_trainees_report_to_trainer
    user_tasks =
      UserTask.by_tasks_id(tasks.pluck(:id)).ready.today
    trainers.each do |trainer|
      CourseMailer.delay.trainee_daily_report user_tasks, trainer.email,
        name
    end
  end
end
