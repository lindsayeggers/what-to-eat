Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :welcome
  root 'welcome#index'
	get '/result' => 'welcome#result'
	get '/reload' => 'welcome#reload'
end
