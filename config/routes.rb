Rails.application.routes.draw do
  get 'welcome/admin_index' => 'welcome#admin_index'
  
  # get 'users/index' => 'users#index'
 #get 'students/index'
  root 'users#login'
  
  
  
  get '/users/student_index'=> "users#student_index"
  get '/users/instructor_index'=> "users#instructor_index"
  get '/users' => "users#index"

  get 'users/logout'=> "require_login"
  get "users/student_index/logout"=>"require_login"
get "users/instructor_index/logout"=> "require_login"  
  
    resources :users

  resources :instructors do
    collection { post :import }
  end
  resources :students do
    collection { post :import }
  end
  resources :sections do
    collection { post :import }
    # resources :students
  end
  
  # match 'students/new' => 'students#new', :via => [:get, :post], as: :new_student
  # get 'users' => 'users#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  
  

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
  match ':controller(/:action(/:id))', :via => [:get, :post]
end
