Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  resources :members, only: [:edit, :update] do
    collection do
      resources :session, only: [:new, :create], controller: 'members/sessions'
      resources :resgistration, only: [:new, :create], controller: 'members/resgistrations'
      delete 'session', to: 'members/sessions#destroy'
      get 'password/new', to: 'members/passwords#new'
      get 'password/edit', to: 'members/passwords#edit'
      get 'password/forget', to: 'members/passwords#forget'
      put 'password', to: 'members/passwords#update'
    end
  end
end
