Rails.application.routes.draw do

  devise_for :users
  root 'index#index'

  resources :index do
    collection { post :import }
  end
  get 'export' => 'index#download', :defaults => { :format => 'csv' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
