Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               registrations: 'registrations',
               sessions: 'sessions',
               passwords: 'passwords',
             }
  devise_scope :user do
    get '/users/magic_link', to: 'devise/passwordless/magic_links#show', as: 'users_magic_link'
    post '/create_magic_link', to: 'sessions#create_magic_link', as: 'create_magic_link'
  end
  root to: "home#index"
  get 'users/show', to: 'users#show', as: 'user_root'
end
