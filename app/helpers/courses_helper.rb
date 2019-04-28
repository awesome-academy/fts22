module CoursesHelper
  def count_trainee_in course
    course.users.size
  end
end
