Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index', as: :index
  post '/', to: 'welcome#retrieve_from_api', as: :get_info

  post '/change-user', to: 'application#change_user', as: :change_user

  resources :meetings
end
