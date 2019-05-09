Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/info/:magic_number', to: 'info#get', constraints: { magic_number: /\d*/ }
  get '/info/:magic_number', to: 'info#get_xml'

end
