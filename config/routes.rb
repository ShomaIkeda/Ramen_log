Rails.application.routes.draw do
  # 顧客用

devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
 scope module: :public do
 
 root to: "homes#top"
 get 'top', to: 'homes#top'
 get 'about', to: 'homes#about'
 get 'users/mypage' => 'users#show', as: 'mypage'
 resources :reviews, only: [:index,:show,:create,:new,:edit,:update,:destroy]
 resources :users, only: [:show,:edit,:update]
 resources :shops, only: [:index,:new,:create,:show,:edit,:update]
 resources :menus, only: [:index,:new,:create,:show,:edit,:update,:destroy]
 resources :genres, only: [:index]
 
 end
 

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
namespace :admin do

root to: "homes#top"
get "top", to: "homes#top" 
get "about", to: "homes#about"
get 'search' => 'homes#search', as: 'search'
resources :shops,only: [:index,:new,:create,:show,:edit,:update]
resources :reviews, only: [:index,:show,:destroy]
resources :menus, only: [:index,:new,:create,:show,:edit,:update,:destroy]
resources :genres,only: [:index,:create,:edit,:update]
    
end
end
