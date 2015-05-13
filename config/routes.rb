Rails.application.routes.draw do
  resources :categories do
    resources :products do
      resources :reviews
    end
  end
	
	resources :users
	
  devise_for :user, :controllers => { registrations: 'registrations' }
  root 'categories#index'
end
