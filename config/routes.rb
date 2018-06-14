require 'sidekiq/web'
Rails.application.routes.draw do

  mount Sidekiq::Web, at: '/sidekiq'
  
  namespace :api do
    namespace :v1 do 
      namespace :gps do 
          resources :waypoints
      end
    end
  end
end
