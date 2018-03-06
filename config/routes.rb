Rails.application.routes.draw do
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'register', to: 'devise/registrations#new', as: "new_user_registration"
    get 'logout', to: 'devise/sessions#destroy'
  end

devise_for :users, path:'', path_names: { sign_in: 'login', sign_out: 'logout' }

  resources :users
  resources :products do
    resources :comments
  end

  resources :orders, only:[:index, :show, :create, :destroy]
  get 'simple_pages/about'

  get 'simple_pages/contact'

  get 'simple_pages/index'

  get 'simple_pages/landing_page'

  get 'simple_pages/products'

  post 'simple_pages/thank_you'

  get 'admin/users#show'




  root  'simple_pages#landing_page'





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
