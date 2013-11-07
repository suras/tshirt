Tshirt::Application.routes.draw do
  

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :authentications
  # get "/sign_in", :to => "home#sign_in", :as => "sign_in"



  root to: 'home#index'
  get "/designs", :to => "designs#index", :as => "designs"
  get "/design_categories", :to => "designs#category", :as => "design_category"
  post "/save_user_images", :to => "designs#save_user_images"
  get "/contact", :to => "home#new_contact", :as => "contact"
  post "/contact", :to => "home#create_contact", :as => "contact_us"
  get "/about_us", :to => "home#about_us", :as => "about"
  get "/checkout", :to => "orders#checkout", :as => "checkout"
  get "/get_product", :to => "products#get_product", :as => "get_product"
  get "/products", :to => "products#products", :as => "product"
  resources :categories
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
  controllers: {omniauth_callbacks: "authentications", registrations: "registrations"}

  match '/auth/:provider/callback' => 'authentications#create'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
