  require "spec_helper"

  describe "trainer/trainees/edit.html.erb", type: "view" do
    subject {rendered}
    let(:trainee) {FactoryBot.create :trainee}

    before do
      assign :trainee, trainee
      assign :id, trainee.id
      render
    end

    it {is_expected.to have_content "Edit trainee"}
    
    describe "form" do
      it{assert_select "form[action*=?]", trainer_trainee_path(id: trainee.id)}

      it{is_expected.to have_field "user_name"}

      it{is_expected.to have_field "user_email"}

      it{is_expected.to have_selector "input", class: "btn btn-primary"}

      it{is_expected.to have_link "Cancel", href: trainer_trainees_path}
    end

  end
