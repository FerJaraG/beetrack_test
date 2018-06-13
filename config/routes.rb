Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do 
      namespace :gps do 
          resources :waypoints
      end
    end
  end
end
