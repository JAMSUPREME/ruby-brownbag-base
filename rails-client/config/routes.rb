Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  post '/get-info', to: 'welcome#retrieve_from_api', as: :get_info
end
