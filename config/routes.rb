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
      resources :facilities, only: [:show, :index]
    end
    
    controller :users do
      get 'users/mypage' => "users#mypage"
      get '/users/information/edit' => "users#edit"
      patch '/users/information' => "users#update"
      get 'users/unsubscribe' => "users#unsubscribe"
      patch 'users/withdraw' => "user#withdraw"
      get 'users/bookmark' => "users#bookmark"
      get 'users/mycomment' => "users#mycomment"
      resources :users do
        controller :userservices do
          resources :userservices, only: [:show, :create, :update, :destroy]
        end
        controller :usercomments do
          resources :usercomments, only: [:show, :create, :update, :destroy]
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
        controller :softcomments do
          resources :softcomments, only: [:show, :create, :update, :destroy]
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
      resources :facilities, only: [:show, :edit, :update] do
        controller :usercomments do
          resources :usercomments, only: [:show, :update, :destroy]
        end
        controller :userservices do
          resources :userservices, only: [:show, :create, :update, :destroy]
        end
      end
    end
    
    controller :softs do
      get 'softs/new' => "softs#new"
      resources :softs, only: [:show, :index, :edit, :update, :create] do
        controller :softcomments do
          resources :softcomments, only: [:show, :update, :destroy]
        end
      end
    end
    
    controller :services do
      resources :services, only: [:index, :edit, :update, :create, :destroy]
    end
    
    controller :contacts do
      resources :contacts, only: [:index, :update]
    end
    
    controller :notifications do
      resources :notifications, only: [:index, :update]
    end
    
  end


  
end