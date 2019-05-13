User.create!(name: "Vu Phan",
  email: "vuphan@sun-asterisk.com",
  password: "11111111",
  role: 0,
  password_confirmation: "11111111")

User.create!(name: "Admin",
  email: "admin@sun-asterisk.com",
  password: "11111111",
  role: 1,
  password_confirmation: "11111111")

User.create!(name: "Bui Lam Quang Ngoc",
  email: "bui.lam.quang.ngoc@sun-asterisk.com",
  role: 0,
  password: "11111111",
  password_confirmation: "11111111")

User.create!(name: "Pham Xuan Nam",
  email: "pham.xuan.nam@sun-asterisk.com",
  role: 0,
  password: "11111111",
  password_confirmation: "11111111")

User.create!(name: "Nguyen Van Luc",
  email: "nguyen.van.luc@sun-asterisk.com",
  role: 0,
  password: "11111111",
  password_confirmation: "11111111")

User.create!(name: "Ton That Nhat Quan",
  email: "ton.that.nhat.quan@sun-asterisk.com",
  role: 0,
  password: "11111111",
  password_confirmation: "11111111")

User.create!(name: "Ho Minh Huy",
  email: "phandanghaivu@gmail.com",
  role: 2,
  password: "11111111",
  password_confirmation: "11111111")

User.create!(name: "Vu Thi Tran Van",
  email: "vu.thi.tran.van@sun-asterisk.com",
  role: 2,
  password: "11111111",
  password_confirmation: "11111111")

User.create!(name: "Pham Van Chien",
  email: "pham.van.chien@sun-asterisk.com",
  role: 2,
  password: "11111111",
  password_confirmation: "11111111")

User.create!(name: "Do Thi Diem Thao",
  email: "do.thi.diem.thao@sun-asterisk.com",
  role: 2,
  password: "11111111",
  password_confirmation: "11111111")

Course.create!(name: "Ruby on rails 21",
  description: "Ruby training batch 21",
  image: "course-2.jpg",
  start_date: Time.now + 1.day,
  end_date: Time.now + 2.months,
  status: 0)

Course.create!(name: "PHP laravel 21",
  description: "PHP training batch 21",
  image: "course-4.jpg",
  start_date: Time.now + 1.day,
  end_date: Time.now + 2.months,
  status: 2)

UserCourse.create!(user_id: 1,
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

CourseSupervisor.create!(user_id: 7,
  course_id: 1)

CourseSupervisor.create!(user_id: 7,
  course_id: 2)

Subject.create!(name: "Rails",
  description: "Rails tutorial")

Subject.create!(name: "Git",
  description: "Git basic and advance")

Subject.create!(name: "Mysql",
  description: "MySql basic")

Subject.create!(name: "Ruby",
  description: "Ruby programing language")

Subject.create!(name: "PHP",
  description: "PHP programing language")

Subject.create!(name: "Laravel",
  description: "Laravel quicktasks")

Subject.create!(name: "Devops",
  description: "Basic command")

UserSubject.create!(user_id: 1,
  subject_id: 1)

CourseSubject.create!(course_id: 1,
  subject_id: 1,
  start_date: Time.zone.now + 1.day,
  end_date: Time.zone.now + 3.days)

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
  status: 1)
