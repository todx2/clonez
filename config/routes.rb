Rails.application.routes.draw do
  
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  get  '/signup',  to: 'users#new'

  #ted experiment--may 20 2018 --same old crsf  invalid authenticity token seen
 
 #ted experiment again may 30 2018  nice but u have make it work on local first
  #post  '/signupx',  to: 'users#new'
  
  #get 'users/new'

  #get 'static_pages/home'

  #get 'static_pages/help'

  #root 'application#selam'
  #added  ted to make it pass a test
  #get  'static_pages/about'
  #get  'static_pages/contact'
  root 'static_pages#home'

  #now u know this well
  #just to refine only may 16 2018
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'

  #added to see user/1 from browser but needs more

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  
  #may 20 2018
  resources :account_activations, only: [:edit]
  #may 25 2018
  resources :password_resets,     only: [:new, :create, :edit, :update]
  #may 27 2018
  resources :microposts,          only: [:create, :destroy]




end
