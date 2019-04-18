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
  status: 2)

UserCourse.create!(user_id: 3,
  course_id: 2,
  status: 2)

Subject.create!(name: "Rails",
  description: "Rails tutorial")

UserSubject.create!(user_id: 1,
  subject_id: 1)

CourseSubject.create!(course_id: 1,
  subject_id: 1,
  start_date: Time.zone.now,
  working_day: 10)

Task.create!(name: "chapter 3",
  description: "Static pages",
  course_subject_id: 1)

Task.create!(name: "chapter 4",
  description: "Filling layouts",
  course_subject_id: 1)

UserTask.create!(user_id: 1,
  task_id: 1,
  short_description: "pull request https://abc.com/xyz/pull/8",
  status: 1)

UserTask.create!(user_id: 1,
  task_id: 2,
  short_description: "pull request https://abc.com/xyz/pull/9",
  status: 0)
