Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "sessions#new"

    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :courses, only: %i(index show)
    resources :subjects, only: :show
    resources :user_tasks, only: :update

    namespace :admin do
      resources :subjects, except: :show
      resources :courses
      resources :course_supervisors, only: %i(create destroy)
      resources :course_subjects, only: %i(create destroy)
    end
  end
end
