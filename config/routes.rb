Myapp::Application.routes.draw do


  resources :preguntas
  resources :tipo_preguntas
  resources :opiniones
  resources :tipo_opiniones
  resources :noticias
  resources :tipo_noticias
  resources :ubicaciones
  resources :sectores
  resources :sectors
  resources :tipo_ubicaciones
  resources :ciudades
  resources :estados
  resources :paises
  resources :discapacidades
  resources :tipo_discapacidades
  resources :patologias
  resources :tipo_patologias
  resources :vacunas
  resources :adicciones
  resources :tipo_adicciones
  resources :grupo_sanguineos
  resources :cirugias
  resources :tipo_cirugias
  resources :estado_civiles
  resources :ocupaciones
  resources :profesiones
  resources :lesiones
  resources :tipo_lesiones
  resources :habitos
  resources :tipo_habitos
  resources :option_menus
  resources :sexos

  get "home/index"
  get "home/minor"
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
root to: 'home#index'
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
