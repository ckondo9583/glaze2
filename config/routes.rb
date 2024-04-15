Rails.application.routes.draw do
  namespace :admin do
    get 'tags/index'
    get 'tags/edit'
  end
   # 顧客用
   # URL /users/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

   # 管理者用
   # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  # ゲストログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  namespace :admin do
    resources :users , only:[:index,:show,:edit,:update]
    resources :tags , only:[:index, :create, :edit, :update, :destroy]
    resources :calculations , only:[:index,:show,:update,:destroy] do
    resources :comments , only:[:index,:destroy],module: :calculations
  end
    get 'homes/top'

  end


 scope module: :public do
    resources :homes ,only:[:top,:about]
    resources :users, only: [:show, :edit, :update]
    resources :calculations, only: [:new, :index, :show, :edit, :update, :create, :destroy] do
    resources :comments, only:[:create, :destroy]
    resources :favorites, only:[:create, :destroy]
    end

    get '/users/unsubscribe', to: 'users#unsubscribe', as: 'users_unsubscribe'
    # patch 'users/:id' ,to: 'users#update', as: 'users_update'
    patch '/users/withdraw', to: 'users#withdraw', as: 'users_withdraw'
    get '/', to: 'homes#top' , as: 'user_top'
    get '/about', to: 'homes#about' , as: 'user_about'
    post '/', to: 'homes#calculate', as: 'calculate'

  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
