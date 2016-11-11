Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :users
  resources :ideas
  resources :roles
  resources :comments
  match '/all_ideas',  to: 'ideas#index',     via: 'get'
  match '/all_ideas/:type',  to: 'ideas#all_ideas',     via: 'get'
  match '/login',  to: 'users#login',     via: 'post'
  match '/logout',  to: 'users#logout',     via: 'get'
  match '/delete/:id',  to: 'users#delete',     via: 'get'
  match '/users/edit/:id',  to: 'users#edit',     via: 'get'
  match '/users/:id',  to: 'users#show',     via: 'get'
  match '/register',  to: 'users#register',     via: 'get'
  match '/make_admin/:id', to: 'users#make_admin', via: 'get'
  match '/all_users', to: 'users#all_users',	via: 'get'
  match '/contact_us', to: 'users#contact_us',  via: 'get'
end
