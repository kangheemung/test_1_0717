Rails.application.routes.draw do
  

  root 'static_pages#home'
  get 'static_pages/help'=>'static_pages#help',as: 'help'
    get 'static_pages/about'=>'static_pages#about',as: 'about'
    get 'static_pages/contact'=>'static_pages#contact',as: 'contact'
  get 'users/index'=>'users#index',as: 'users_index'
  get 'users/new'=>'users#new',as: 'new_user'
  post 'users/create'=>'users#create',as: 'users_create'
  delete 'users/destroy'=>'users#destroy',as: 'users_destroy'
  get 'users/:id/edit'=>'users#edit',as: 'users_edit'
  patch  'users/:id/update'=>'users#update',as: 'users_update'
  get 'users/:id' =>'users#show',as: 'user'
  
  get 'sessions/new'=>'sessions#new',as: 'sessions_new'
  post'sessions/create'=>'sessions#create',as: 'sessions_create'
  get 'microposts/new'=>'microposts#new',as: 'microposts_new'
  get 'microposts/edit'=>'microposts#edit',as: 'microposts_edit'
  patch 'microposts/update'=>'microposts#update',as: 'microposts_update'
  get 'microposts/:id'=>'microposts#show',as: 'microposts_show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
