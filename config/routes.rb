Rails.application.routes.draw do
  root 'chatroom#index'
  
  get 'signup', to: 'users#new'

  post 'signup', to: 'users#create'

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  get 'logout', to: 'sessions#destroy'

  post 'message', to: 'messages#create'

  get 'messages', to: 'messages#index'

  get 'users', to: 'users#index'

  mount ActionCable.server, at: '/cable'
end
