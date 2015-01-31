Rails.application.routes.draw do

  # routes for devise, :skip => [:sessions] can skip routes for sessions controller.
  devise_for :users, skip: [], controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: "users/registrations"
  }

  # setting root to global index page
  root 'pages#index'

  # user can use their nick name as personal url ## TODO ## deal with spaceses.
  get '/:nick_name' => 'users#show', as: :user_index

  resources :users, only: [:show] do
    resources :diaries, module: 'users'
    resources :albums, module: 'users'
  end


  # pages which in developing status
  # get '/users/tim_cook' => 'frontend#index', :as => :user_index
  # get '/users/tim_cook/diaries' => 'frontend#diaries_index', :as => :user_diaries
  # get '/users/tim_cook/diary/23' => 'frontend#diary_show', :as => :user_diary_show
  # get '/users/tim_cook/albums' => 'frontend#albums_index', :as => :user_albums
  get '/users/tim_cook/albums/17' => 'frontend#album_show', :as => :user_album_show

  resources :statuses, :only => [:create]

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
