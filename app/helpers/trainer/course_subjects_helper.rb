module Trainer::CourseSubjectsHelper
  def course_subject_element course_subject
    case course_subject.status
    when CourseSubject.statuses.key(0)
      {
        status: t(".#{course_subject.status}"),
        button: render("trainer/course_subjects/start_subject_button",
          course_subject: course_subject)
      }
    when CourseSubject.statuses.key(1)
      {
        status: t(".#{course_subject.status}"),
        button: render("trainer/course_subjects/finish_subject_button",
          course_subject: course_subject)
      }
    else
      {status: t(".finished")}
    end
  end
end
