Rails.application.routes.draw do
  get 'test_two_app/make_predictions'

  get 'test_two_app/view_all_predictions'

  get 'test_two_app/login'

  get 'sandbox', to: 'test_two_app#sandbox'

  get 'predict', to: 'test_two_app#predict_matches'

  get 'view', to: 'test_two_app#view_all_predictions'

  get 'login', to: 'test_two_app#login'

  get 'new_gameweek', to: 'test_two_app#new_gameweek'

  get 'enter_scores', to: 'test_two_app#enter_scores'

  get 'register', to: 'test_two_app#register'

  get 'edit_settings', to: 'test_two_app#edit_settings'

  get 'leaderboard', to: 'test_two_app#leaderboard'

  get 'forgot_password', to: 'test_two_app#forgot_password'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'test_two_app#login'

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
