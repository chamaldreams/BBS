Rails.application.routes.draw do
  get 'dashboard/index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'visitors#index'
  
 

end
