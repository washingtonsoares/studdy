Rails.application.routes.draw do
  resources :enrollments
  resources :student_classes
  resources :learning_contents
  resources :colleges
  resources :courses
  devise_for :users
  root to: 'colleges#dashboard'

  get 'dashboard', to: 'colleges#dashboard'
  post "/create-watched-media" => "courses#save_watched_media"
end
