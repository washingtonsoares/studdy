Rails.application.routes.draw do
  resources :enrollments
  resources :student_classes
  resources :learning_contents
  resources :colleges
  resources :courses
  devise_for :users


  get 'dashboard', to: 'colleges#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
