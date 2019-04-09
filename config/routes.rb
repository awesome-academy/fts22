Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    resources :courses, only: :index
  end
end
