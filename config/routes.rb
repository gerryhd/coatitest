Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  authenticate :user do
    resources :projects do
      member do
        get "add-task", to: "tasks#new"
        get "send-project-summary", to: "projects#show", as: "send_summary"
        post "add-task", to: "tasks#create", as: "add_task_to"
      end
    end
    resources :tasks do
      get "complete-task", to: "tasks#mark_completion", as: "complete"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'application#index'
end
