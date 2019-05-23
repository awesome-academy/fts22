require "rails_helper"
require "shoulda-matchers"

RSpec.describe Admin::CoursesController, type: :controller do
  let(:course){FactoryBot.create :course}
  let(:admin){FactoryBot.create :user}
  let(:invalid_params){{name: ""}}

  describe "before action" do
    before{sign_in admin}

    it{is_expected.to use_before_action :authenticate_user!}

    it{is_expected.to use_before_action :load_course}
    
    it{is_expected.to use_before_action :set_locale}
  end

  describe "POST create" do
    before {sign_in admin}

    context "when valid attributes" do
      it do
        post :create, params: {course: FactoryBot.attributes_for(:course)}
        expect(assigns(:course)).to be_a Course
      end
    end

    context "when invalid attributes" do
      it do
        post :create, params: {course: invalid_params}
        expect(response).to render_template :new
      end
    end
  end

  describe "GET index" do
    context "when user not signed in" do
      before{get :index}

      it{expect(response).to redirect_to new_user_session_path locale: ""}

      it{is_expected.to set_flash.to I18n.t "devise.failure.unauthenticated"}
    end

    context "when user signed in but not an admin" do
      let(:not_admin){FactoryBot.create :not_admin}
      before do
        sign_in not_admin
        get :index
      end

      it{is_expected.to set_flash[:danger].to(
        I18n.t "controllers.autorization_fail")}
    end

    context "when user signed in as an admin" do
      before do
        sign_in admin
        get :index
      end

      it{expect(response).to render_template :index}
    end
  end

  describe "GET new" do
    before{get :new}
    context "when user not signed in" do
      before{get :new}

      it{expect(response).to redirect_to new_user_session_path locale: ""}

      it{is_expected.to set_flash.to I18n.t "devise.failure.unauthenticated"}
    end

    context "when user signed in but not an admin" do
      let(:not_admin){FactoryBot.create :not_admin}
      before do
        sign_in not_admin
        get :new
      end

      it{is_expected.to set_flash[:danger].to(
        I18n.t "controllers.autorization_fail")}
    end

    context "when user signed in as an admin" do
      before do
        sign_in admin
        get :new
      end

      it{expect(response).to render_template :new}
    end
  end

  describe "GET edit" do
    context "when user not signed in" do
      before{get :edit, params:{id: course.id}}

      it{expect(response).to redirect_to new_user_session_path locale: ""}

      it{is_expected.to set_flash.to I18n.t "devise.failure.unauthenticated"}
    end

    context "when user signed in but not an admin" do
      let(:not_admin){FactoryBot.create :not_admin}
      before do
        sign_in not_admin
        get :edit, params:{id: course.id}
      end

      it{is_expected.to set_flash[:danger].to(
        I18n.t "controllers.autorization_fail")}
    end

    context "when user signed in as an admin" do
      before do
        sign_in admin
        get :edit, params:{id: course.id}
      end

      it{expect(response).to render_template :edit}
    end
  end
end
