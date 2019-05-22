require "faker"
FactoryBot.define do
  factory :course do |c|
    c.name {Faker::Name.name}
    c.description {Faker::Name.name}
    c.image {Faker::Lorem.sentence(5)}
    c.start_date {Time.now + 1.day}
    c.end_date {Faker::Date.forward(23) + 2.days}
    c.status {0}
  end
end
