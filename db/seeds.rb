User.create!(name: "Vu Phan",
  email: "vuphan@sun-asterisk.com",
  password: "11111111",
  role: 0,
  password_confirmation: "11111111")

User.create!(name: "Bui Lam Quang Ngoc",
  email: "bui.lam.quang.ngoc@sun-asterisk.com",
  role: 0,
  password: "11111111",
  password_confirmation: "11111111")

User.create!(name: "Ho Minh Huy",
  email: "ho.minh.huy@sun-asterisk.com",
  role: 1,
  password: "11111111",
  password_confirmation: "11111111")

Course.create!(name: "PHP laravel",
  description: "laravel tutorial",
  image: "course-2.jpg",
  start_date: Time.now,
  end_date: Time.now + 2.months,
  status: 0)

Course.create!(name: "Ruby on rails",
  description: "Ruby on rails tutorial",
  image: "course-4.jpg",
  start_date: Time.now,
  end_date: Time.now + 2.months,
  status: 1)

UserCourse.create!(user_id: 1,
  course_id: 1,
  status: 1)

UserCourse.create!(user_id: 2,
  course_id: 1,
  status: 1)

UserCourse.create!(user_id: 3,
  course_id: 1,
  status: 1)

UserCourse.create!(user_id: 1,
  course_id: 2,
  status: 1)

UserCourse.create!(user_id: 3,
  course_id: 2,
  status: 1)

Subject.create!(
  name: "GIT",
  description: "git basic and advance")

Subject.create!(
  name: "MySQL",
  description: "mysql basic and advance")

Subject.create!(
  name: "Ruby",
  description: "prepare to learn rails")

Subject.create!(
  name: "Rails",
  description: "Rails tutorial")

Subject.create!(
  name: "PHP",
  description: "prepare to learn Laravel")

Subject.create!(
  name: "Laravel",
  description: "Laravel tutorial")

CourseSubject.create!(
  course_id: 1,
  subject_id: 1)

CourseSubject.create!(
  course_id: 1,
  subject_id: 2)

CourseSubject.create!(
  course_id: 2,
  subject_id: 1)

CourseSubject.create!(
  course_id: 2,
  subject_id: 2)

CourseSubject.create!(
  course_id: 2,
  subject_id: 3)

CourseSubject.create!(
  course_id: 2,
  subject_id: 4)
