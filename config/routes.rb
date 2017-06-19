Rails.application.routes.draw do

  devise_for :users
  resources :users
  # resources :users, except: [:index]

	# root 'products#index'
	# 5.1 - Reroute your root page to a different page on your site...

  resources :products

  resources :orders, only: [:index, :show, :create, :destroy]

  root 'static_pages#landing_page'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  post 'static_pages/thank_you'

	  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
