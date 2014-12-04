Spree::Core::Engine.routes.draw do
  namespace :admin do
    patch '/prizes/:id/winner' => 'prizes#winner', as: 'prize_winner'

    resources :prizes do
      resources :candidates, :only => [:edit, :update, :destroy], controller: 'prizes/candidates'
    end
  end

  resources :prizes, only: [:index] do
    resources :candidates, only: [:create, :new], controller: 'prizes/candidates'
  end
end
