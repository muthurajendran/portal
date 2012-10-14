Placement::Application.routes.draw do
  resources :admin_announcements

  resources :admin_news_queues

  resources :admin_news

  resources :admin_user_sessions

  root :to  => "home#index"
  resources :user_sessions, :collections=> {:roles => :get}
 

  resources :users, :collections=> {:edits => :get}
  resources :users, :collections=> {:update_password => :put}
  
  resources :students_registrations, :collections=> {:register=>:get,:unregister=> :get, :display_criterion=> :get }

  get "companies/new"

  get "companies/edit"

  get "branches/new"

  get "branches/edit"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  match 'login' =>'user_sessions#new'
  match 'admin1234567890' =>'user_sessions#new'
  match 'logout' =>'user_sessions#destroy'
  
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id(.:format)))'
  #ActionController::Routing::Routes.draw do |map|
   
   # map.connect '*path',:controller=>'routing_error',:action=>'catcher'
  #end  
end