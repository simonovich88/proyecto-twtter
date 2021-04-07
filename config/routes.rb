Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  root to: "tweets#index"

  resources :tweets
  
  put 'tweet/:id/like', to: 'tweets#like', as: 'like'
  delete 'tweet/:id/dislike', to: 'tweets#dislike', as: 'dislike'

  post 'tweet/:id/retweet', to: 'tweets#retweet', as: 'retweet'

  get 'tweets/search/:search', to: 'tweets#search', as: 'search'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get 'home/profile', to: 'home#profile'
  get 'home/tweets', to: 'home#tweets'
  post 'home/:id/follow', to: "home#follow", as: "follow_user"
  delete 'home/:id/unfollow', to: "home#unfollow", as: "unfollow_user"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
