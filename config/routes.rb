Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :startups, :only => [:create, :index, :show]
    end
  end

end
