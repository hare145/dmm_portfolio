Rails.application.routes.draw do
 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
}

   devise_for :admins, skip: [:registrations, :passwords],  controllers: {
    sessions: "admin/sessions"
}

  scope module: :public do
   
    controller :homes do
      root to: "homes#top"
    end
    
    controller :facilities do
      resources :facilities, only: [:show, :index] do
        controller :user_comments do
          resources :user_comments, only: [:show, :index, :create, :update]
        end
      end
    end
    
    controller :users do
      get 'users/mypage' => "users#mypage"
      get '/users/information/edit' => "users#edit"
      patch '/users/information' => "users#update"
      get 'users/unsubscribe' => "users#unsubscribe"
      patch 'users/withdraw' => "user#withdraw"
      get 'users/bookmark' => "users#bookmark"
      resources :users do
        controller :user_services do
          resources :user_services, only: [:show, :create, :update]
        end
        controller :user_comments do
          resources :user_comments, only: [:show, :index, :create, :update]
        end
        controller :usermarks do
          resources :usermarks, only: [:create, :destroy]
        end
      end
    end
    
    controller :softs do
      get 'softs/new' => "softs#new"
      get 'softs/notice' => "softs#notice"
      resources :softs, only: [:show, :index, :create, :update] do
        controller :soft_comments do
          resources :soft_comments, only: [:show, :index, :create, :update]
        end
        controller :softmarks do
          resources :softmarks, only: [:create, :destroy]
        end
      end
    end
    
    controller :contacts do
      resources :contacts, only: [:create]
      get 'contacts/new' => "contacts#new"
      get 'contacts/notice' => "contacts#notice"
    end
    
    controller :services do
      resources :services, only: [:index]
    end
    
  end


  namespace :admin do
    
    controller :homes do
      root to: "homes#top"
    end
    
    controller :facilities  do
      resources :facilities, only: [:show, :edit, :update]
    end
    
    controller :softs do
      get 'softs/new' => "softs#new"
      resources :softs, only: [:show, :index, :edit, :update, :create]
    end
    
    controller :services do
      resources :services, only: [:index, :edit, :update, :create, :destroy]
    end
    
    controller :contacts do
      resources :contacts, only: [:index, :edit, :update]
    end
    
    controller :soft_edit_notices do
      resources :soft_edit_notices, only: [:index]
    end
    
  end
  


  
end