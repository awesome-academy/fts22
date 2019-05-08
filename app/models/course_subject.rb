class CourseSubject < ApplicationRecord
  belongs_to :course
  belongs_to :subject
  has_many :tasks
  scope :by_course_id, ->(course_id){where course_id: course_id}
  scope :sorted_by_date, ->{order :start_date, :end_date}
  validate :date_cannot_be_duplicated
  validates :start_date, presence: true,
    date: {after_or_equal_to: Time.now}, on: :create
  validates :end_date, presence: true,
    date: {after: :start_date}, on: :create
  enum status: {open: 0, started: 1, finished: 2}

  def date_cannot_be_duplicated
    CourseSubject.by_course_id(course_id).each do |course_subject|
      if start_date&.between? course_subject.start_date, course_subject.end_date
        add_subject_duplicate_message :start_date, course_subject
      elsif end_date&.between? course_subject.start_date,
          course_subject.end_date
        add_subject_duplicate_message :end_date, course_subject
      end
    end
  end

  private

  def add_subject_duplicate_message attribute, course_subject
    errors.add attribute,
      I18n.t("course_subject.date_duplicate", name: course_subject.subject.name)
  end
end
