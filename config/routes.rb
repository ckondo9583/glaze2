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

  namespace :admin do
    get 'comments/index'
    get 'calculations/index'
    get 'calculations/show'
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'homes/top'
  end


 scope module: :public do
    get 'calculations/index'
    get 'calculations/show'
    get 'calculations/edit'
    get 'users/show'
    get 'users/edit'
    get 'homes/top'
    get 'homes/about'

    get '/', to: 'homes#top' , as: 'user_top'
    get '/about', to: 'homes#about' , as: 'user_about'
    get '/users/unsubscribe', to: 'users#unsubscribe', as: 'users_unsubscribe'
    patch 'users/:id' ,to: 'userss#update', as: 'users_update'
    patch '/users/withdraw', to: 'users#withdraw', as: 'users_withdraw'
    post '/calculations' ,to: 'calculations#create', as: 'calculations_create'
    patch '/calculations' ,to: 'calculations#update', as: 'calculations_update'

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
