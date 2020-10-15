Rails.application.routes.draw do
  resources :users
  root to: 'sessions#new'
  post "/sessions", to: "sessions#create", as: "sessions"
  delete "/sessions", to: "sessions#destroy"
  get "/user_answers/new", to: "user_answers#new", as: "new_user_answers"
  post "/user_answers", to: "user_answers#create", as: "user_answers"
  get "/teacher_portal", to: "users#teacher_portal", as: "teacher_portal"
  patch "/update_category", to: "users#update_category", as: "update_category"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
