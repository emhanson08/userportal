Rails.application.routes.draw do
	root 'static_pages#index'

	resources :patients do
		collection do
			get :search
		end
	end
	resources :appointments, only: [:show]
	resources :clinicians, only: [:index, :show]
end
