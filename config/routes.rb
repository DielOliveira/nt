Rails.application.routes.draw do
  resources :doacaos
  resources :ciclos
  resources :redes
  resources :redetipos
  resources :usuarios
  resources :cadastros
  resources :dadosfinanceiros
  resources :contabancariatipos
  resources :bancos
  resources :operadoras
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root  'static_pages#home'

  match '/faq', to: 'static_pages#faq', via: 'get'
  match '/wellcome', to: 'static_pages#wellcome', via: 'get'
  match '/configu', to: 'static_pages#configu', via: 'get'

  get '/redeslist/:cadastro_id', to: 'static_pages#redeslist', as: 'redeslist'


    match '/login', to: 'nt_autentication#login', via: 'get'
  match '/login', to: 'nt_autentication#login', via: 'post'
  match '/logoff', to: 'nt_autentication#logoff', via: 'get'

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
