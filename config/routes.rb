Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#show" 

  resources :users do 
    resources :games, only: [:new, :create, :show]
  end


#routes.rb
#match 'users/:id' => 'users#show', via: :get
# # or 
get 'users/:id' => 'users#show'
# # or
# resources :users, only: [:show]

get 'users/:id/games:id' => 'game#show'


end
