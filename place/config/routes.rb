Rails.application.routes.draw do
  resources :holiday_types
  resources :holidays
  resources :authors
  resources :articles
  get 'welcome/index'


  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
