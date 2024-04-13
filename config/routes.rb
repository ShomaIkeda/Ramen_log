Rails.application.routes.draw do
  # 顧客用

devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
 scope module: :public do

 root to: "homes#top"
 get 'search' => 'homes#search', as: 'search'
 get 'top', to: 'homes#top'
 get 'about', to: 'homes#about'
 get 'users/mypage' => 'users#mypage', as: 'mypage'
 get 'users/information/edit' => 'users#edit', as: 'edit_information'
 patch 'users/information' => 'users#update', as: 'update_information'
 get 'users/unsubscribe' => 'users#unsubscribe', as: 'confirm_unsubscribe'
 put 'users/information' => 'users#update'
 patch 'users/withdraw' => 'users#withdraw', as: 'withdraw_user'
 get 'shops/:id/menu' => 'shops#menu', as: 'shop_menu'
 #get 'shops/:id/reviews' => 'reviews#index', as: 'shop_reviews'
 #get 'shops/:id/reviews/new' => 'shops#new_review', as: 'new_review'
 #resources :reviews, only: [:index,:show,:create,:new,:edit,:update,:destroy]
 resources :users, only: [:index,:show,:edit,:update]
 resources :shops, only: [:index,:new,:create,:show,:edit,:update] do

   resources :reviews
   resources :menus, only: [:index,:new,:create,:show,:edit,:update,:destroy]

 end
 
 resources :reviews do
     resources :review_comments, only: [:create, :destroy]
 end

 resources :genres, only: [:index]

 end


# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
namespace :admin do

get 'top' => 'homes#top', as: 'top'
get "about", to: "homes#about"
get 'search' => 'homes#search', as: 'search'
resources :shops,only: [:index,:new,:create,:show,:edit,:update] do
resources :reviews, only: [:index,:show,:destroy]
resources :menus, only: [:index,:new,:create,:show,:edit,:update,:destroy]
end
resources :genres,only: [:index,:create,:edit,:update]
resources :users, only: [:index, :show, :edit, :update]

end
end
