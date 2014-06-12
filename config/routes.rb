Spree::Core::Engine.routes.draw do
  namespace :admin do
    # get '/prizes/candidates'            => 'prizes/candidates#index'
    # get '/prizes/candidates/:id/edit'   => 'prizes/candidates#edit',    as: 'edit_candidate'
    # get '/prizes/candidates/:id/winner' => 'prizes/candidates#winner',  as: 'winner_candidate'
    # patch '/prizes/candidates/:id'      => 'prizes/candidates#update',  as: 'prize_update_candidate'
    # delete '/prizes/candidates/:id'     => 'prizes/candidates#destroy', as: 'prize_delete_candidate'

    patch '/prizes/:id/winner' => 'prizes#winner', as: 'prize_winner'

    resources :prizes do
      resources :candidates, :only => [:edit, :update, :destroy], controller: 'prizes/candidates'
    end
    
  end

  resources :prizes, only: [:index] do
    resources :candidates, only: [:create, :new], controller: 'prizes/candidates'
  end


end
