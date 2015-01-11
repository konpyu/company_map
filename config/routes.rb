Rails.application.routes.draw do


  namespace :api do
    namespace :v1 do
      resources :startups do
        member do
          post 'like'
        end
      end
    end
  end

end
