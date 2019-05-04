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

    namespace :trainer do
      resources :courses, only: %i(index show)
      resources :user_courses, only: %i(create destroy)
      resources :course_subjects, only: %i(show)
      resources :tasks, except: %i(index new)
      patch "/start-subject/:id", to: "course_subjects#start_subject", as: "start_subject"
      patch "/finish-subject/:id", to: "course_subjects#finish_subject", as: "finish_subject"
    end
  end
end
