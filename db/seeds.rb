User.create!(name: "Vu Phan",
  email: "vuphan@sun-asterisk.com",
  password: "111111",
  password_confirmation: "111111")

Course.create!(name: "Ruby on rails",
  description: "Ruby on rails tutorial",
  start_date: Time.now,
  end_date: Time.now + 2.months,
  status: 1)

UserCourse.create!(user_id: 1,
  course_id: 1,
  status: 1)
