Rails.application.routes.draw do

  devise_for :users
  resources :users
  # resources :users, except: [:index]

	# root 'products#index'
	# 5.1 - Reroute your root page to a different page on your site...

  # resources :products

  resources :products do
    resources :comments
  end  

  resources :orders, only: [:index, :show, :create, :destroy]

  root 'static_pages#landing_page'

  get 'static_pages/about'

  # get 'static_pages/contact'
  get 'messages/new'

  get 'static_pages/index'

  # post 'static_pages/thank_you'
  post 'messages/thank_you'

  post 'messages/new'

  get 'payments/create'

  post 'payments/create'

  Bike_Berlin::Application.routes.draw do |map|
    resources :messages
    root :to => "messages#new"
  end

	  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
