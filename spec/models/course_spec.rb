require "rails_helper"
require "rspec/collection_matchers"
require "shoulda-matchers"

RSpec.describe Course, type: :model do
  let(:course) {FactoryBot.create :course}
  subject {course}

  it "is a Course" do
    is_expected.to be_a_kind_of Course
  end

  it "is valid with all correct informations" do
    expect(course).to be_valid
  end

  describe "#name" do
    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_uniqueness_of(:name).case_insensitive}
    it do
      is_expected.to validate_length_of(:name).is_at_most(
        Settings.app.models.course.name_max_length)
    end
  end

  describe "#description" do
    it {is_expected.to validate_presence_of :description}
    it do
      is_expected.to validate_length_of(:description).is_at_most(
        Settings.app.models.course.description_max_length)
    end
  end

  describe "#start_date" do
    before do
      course.start_date = "1997-03-28"
      course.end_date = "1997-03-29"
    end
    it "is invalid with start date in the past" do
      is_expected.to have(1).error_on :start_date
    end
    it do
      expect(course.errors.messages[:start_date].first).equal?(
        I18n.t "date_validator.date_after_error")
    end
  end

  describe "#end_date" do
    before {course.end_date = "2019-03-27"}
    it "is invalid with end date lower than start date" do
      is_expected.to have(1).error_on :end_date
    end
    it do
      expect(course.errors.messages[:end_date].first).equal?(
        I18n.t "date_validator.date_after_equal_error")
    end
  end

  describe "#status" do
    before {course.status = Course.statuses[:start]}
    it "is invalid when start course with no subject" do
      is_expected.to have(1).error_on :status
    end
    it do
      expect(course.errors.messages[:status].first).equal?(
        I18n.t "course.no_subject")
    end
  end

  describe "associations" do
    it "has many course subjects" do
      is_expected.to have_many(:course_subjects).dependent :destroy
    end

    it "has many subjects" do
      is_expected.to have_many(:subjects).through :course_subjects
    end

    it "has many tasks" do
      is_expected.to have_many(:tasks).through :course_subjects
    end

    it "has many trainers" do
      is_expected.to have_many(:trainers).through(:course_supervisors).source :user
    end
  end
end
