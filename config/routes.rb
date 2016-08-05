Rails.application.routes.draw do
  resources :contatos
  resources :assuntos
  resources :indicados
  resources :reentradas
  resources :mensagems
  #resources :doacaos
  resources :ciclos
  resources :redes
  resources :redetipos
  resources :usuarios
  resources :cadastros
  resources :dadosfinanceiros
  resources :contabancariatipos
  resources :bancos
  resources :operadoras

  resources :reentradas do
    member do
      get :relogin   
    end
  end



  resources :doacaos do
    member do
      get :confirmadoacao   
    end
  end



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root  'static_pages#index', hello_id: 1

  match '/home', to: 'static_pages#home', via: 'get'
  match '/faq', to: 'static_pages#faq', via: 'get'
  match '/wellcome', to: 'static_pages#wellcome', via: 'get'
  match '/configu', to: 'static_pages#configu', via: 'get'

  get '/redeslist/:rede_id', to: 'static_pages#redeslist', as: 'redeslist'
  get '/redeslistciclo', to: 'static_pages#redeslistciclo', as: 'redeslistciclo'

  get '/loginprincipal/:cadastro_id', to: 'static_pages#loginprincipal', as: 'loginprincipal'
  
  get '/exibirlinhas/:ciclo_id', to: 'redes#exibirlinhas', as: 'exibirlinhas'

  get '/novareentrada/:cadastro_id', to: 'reentradas#novareentrada', as: 'novareentrada'
  get '/upgrade_ciclo/:cadastro_id', to: 'ciclos#upgrade_ciclo', as: 'upgrade_ciclo'


  #get '/confirmadoacao/:doacao_id', to: 'doacaos#confirmadoacao', as: 'confirmadoacao'

  match '/doacoesrealizadas', to: 'doacaos#doacoesrealizadas', via: 'get'
  match '/doacoesrecebidas', to: 'doacaos#doacoesrecebidas', via: 'get'
  match '/doacoesareceber', to: 'doacaos#doacoesareceber', via: 'get'
  
  match '/login', to: 'nt_autentication#login', via: 'get'
  match '/login', to: 'nt_autentication#login', via: 'post'
  match '/logoff', to: 'nt_autentication#logoff', via: 'get'

  match '/gerenciarciclos', to: 'ciclos#gerenciarciclos', via: 'get'

  match '/start_ciclo1', to: 'ciclos#start_ciclo1', via: 'get'



  match '/grava_mensagem', to: 'mensagems#grava_mensagem', via: 'get'

  match '/geralinha', to: 'redes#geralinha', via: 'get'


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
