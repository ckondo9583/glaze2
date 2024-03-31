Rails.application.routes.draw do
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
   
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
