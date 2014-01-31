Daysandnights2::Application.routes.draw do
  resources :advertises

  resources :place_types

  resources :types

  resources :places

  resources :events

  get "place/:slug", to: "places#query", as: "slug"

   get "manage/users", to: "user#update"
   get "manage/content", to: "user#content"
   get "manage/admin_content", to: "user#admin_content"
   get "manage", to: "user#manage"

  resources :user do

   post :disapprove, :on => :collection
   post :approve, :on => :collection
   put :complete, :on => :collection
   get "user/:id", to: "user#subscription"
   
  end

  resources :news


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" }
  root "site#index"
  get "contact", to: "site#contact_us"
  get 'contact' => 'contact#new'
  post 'contact' => 'contact#create'
  get "result", to: "site#result"


  resources :places do
    post :addid, :on => :collection
    post :delid, :on => :collection
  end

  resources :events do
    post :like, :on => :collection
    post :dislike, :on => :collection
  end

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
end
