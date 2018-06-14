require 'sidekiq/web'
Rails.application.routes.draw do

  mount Sidekiq::Web, at: '/sidekiq'
  
  namespace :api do
    namespace :v1 do 
      namespace :gps do 
          get 'vehicles/show', to: 'vehicles#show'
          post 'waypoints', to: 'waypoints#create'
      end
    end
  end
end
