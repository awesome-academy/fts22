Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "sessions#new"

    mount Ckeditor::Engine => "/ckeditor"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :courses, only: %i(index show)
    resources :subjects, only: :show
    resources :course_subjects, only: :show
    resources :user_tasks, only: %i(create edit update)

    namespace :admin do
      resources :subjects, except: :show
      resources :courses
      resources :course_supervisors, only: %i(create destroy)
      resources :course_subjects, only: %i(create destroy)
    end

    namespace :trainer do
      resources :courses, only: %i(index show)
      resources :user_courses, only: %i(create destroy)
      resources :course_subjects, only: %i(show update)
      resources :tasks, except: %i(index new)
      patch "/start-subject/:id", to: "course_subjects#start_subject", as: "start_subject"
      patch "/finish-subject/:id", to: "course_subjects#finish_subject", as: "finish_subject"
      post "/start-course/:id", to: "courses#start_course", as: "start_course"
      post "/finish-course/:id", to: "courses#finish_course", as: "finish_course"
    end
  end
end
