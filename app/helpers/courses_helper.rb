module CoursesHelper
  def count_trainee_in course
    course.users.count(&:trainee?)
  end
end
