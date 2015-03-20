Rails.application.routes.draw do
  devise_for :users
  root :to => "pages#index"
  resources :tracks
  resources :users
  resources :electives, :id => /[^\/]+/ 
  resources :students
  resources :electives do
    collection {post :import }
  end
  resources :students do
    collection { post :import }
  end
  resources :students do
    member do
      get 'advise'
    end
  end
  resources :students do
    member do
      get 'delete'
    end
  end
  resources :students do
    member do
      get 'roster'
    end
  end
  resources :electives do
    member do
      get 'delete'
    end
  end
  resources :electives do
    member do
      get 'select'
    end
  end
  resources :students do
    collection do
      delete 'destroy_multiple'
    end
  end
  resources :electives do
    collection do
      delete 'destroy_multiple'
    end
  end
  resources :tracks do
    collection {post :import }
  end
 
# match 'electives/:id' => 'electives#show', :constraints  => { :id => /[0-z\.]+/ }

  # get "/students", :to => "students#index", as: :students
  # get "/student/:id", :to => "students#show", as: :student
  # get "/students/new", :to => "students#new", as: :new_student
  # post "/students", :to => "students#create", as: :create_student
  # get "/students/:id/edit", :to => "students#edit", as: :edit_student
  # post "/students/:id/update", :to => "students#update", as: :update_student
  # match "/students/:id/advise" => "students#advise" via: => :get

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
