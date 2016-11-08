Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  resource :users
  match '/login',  to: 'users#login',     via: 'post'
  match '/logout',  to: 'users#logout',     via: 'get'
  match '/delete/:id',  to: 'users#delete',     via: 'get'
  match '/users/edit/:id',  to: 'users#edit',     via: 'get'
  match '/users/:id',  to: 'users#show',     via: 'get'
  match '/register',  to: 'users#register',     via: 'get'
  match '/make_admin/:id', to: 'users#make_admin', via: 'get'
  match '/all_users', to: 'users#all_users',	via: 'get'
end
