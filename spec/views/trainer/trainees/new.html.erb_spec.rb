  require "spec_helper"

  describe "trainer/trainees/new.html.erb" do
    subject {rendered}
    let(:trainee) {User.new}
    let(:courses) {Course.open}

    before do
      assign :trainee, trainee
      assign :courses, courses
      render
    end

    it {is_expected.to have_content "New trainee"}

    describe "form" do
      it{assert_select "form[action*=?]", trainer_trainees_path}

      it{is_expected.to have_field "user_name"}

      it{is_expected.to have_field "user_email"}

      it{is_expected.to have_selector "select", id: "course", class: "selectpicker"}

      it{is_expected.to have_selector "input", class: "btn btn-primary"}

      it{is_expected.to have_link "Cancel", href: trainer_trainees_path}
    end
  end
