require "rails_helper"

RSpec.feature "Trainee management", type: :feature do
  before do
    user = FactoryBot.create(:trainer)
    visit new_user_session_path
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    click_on "commit"
  end

  scenario "Trainer creates a new trainee" do
    visit new_trainer_trainee_path
    fill_in "user[name]", with: "some trainee"
    fill_in "user[email]", with: "trainee_email@gmail.com"
    click_button "commit"

    expect(page).to have_content I18n.t "trainer.controllers.trainees_controller.created_success"
  end
end
