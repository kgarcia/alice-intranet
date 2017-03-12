Myapp::Application.routes.draw do

  get 'difusiones/update_entidades', as: 'update_entidades'

  resources :medio_difusiones
  resources :perfiles
  resources :tipo_especialidades
  resources :rango_pesos
  resources :rango_edades
  resources :difusiones
  resources :tipo_entidades
  resources :parentescos
  resources :tipo_parentescos
  resources :tipo_difusiones

  match '/search', to: "personas#search", via: "post"

  get 'grafico/generar'

  get 'grafico/citas_por_especialidad'

  get 'grafico/criterios_servicio'

  get 'grafico/citas_por_turno'

  get 'agenda_servicio/', to: 'agenda_servicio#lista'

  get 'historial_cita', to: 'citas#historial'

  get 'cancelar_cita', to: 'citas#cancelar'
  get 'cancelar_cita/:id', to: 'citas#cancelarCita'
  post 'cancelar_cita', to: 'citas#confirmarCancelacion'

  get 'chequear_cita', to: 'citas#chequear'
  get 'chequear_cita/:id', to: 'citas#chequearCita'
  post 'chequear_cita', to: 'citas#guardarChequearCita'

  get 'finalizar_cita', to: 'citas#finalizar'
  get 'finalizar_cita/:id', to: 'citas#finalizarCita'
  post 'finalizar_cita', to: 'citas#guardarFinalizarCita'

  get 'evaluaciones/new/:id', to: 'evaluaciones#evaluarCita'
  resources :tipo_turnos


  resources :informacion_generals
  resources :noticias
  resources :opiniones
  resources :tipo_opiniones
  resources :tipo_preguntas
  resources :tipo_noticias

  get 'agenda_servicio/:id/detalle', to: 'agenda_servicio#detalle', as: :agenda_servicio_detalle

  resources :notificaciones
  resources :tipo_notificaciones
  resources :servicio_eventos
  resources :tipo_preguntas
  resources :tipo_opiniones
  resources :tipo_noticias
  resources :preguntas
  resources :opiniones
  resources :noticias
  resources :universidades
  resources :formacion_academicas
  resources :nivel_formaciones
  resources :eventos
  resources :tipo_eventos
  resources :busquedas
  resources :tipo_busquedas
  resources :categorias
  resources :citas
  resources :evaluaciones
  resources :criterio_tipo_servicios
  resources :calificaciones
  resources :criterios
  resources :servicios
  resources :sexos
  resources :personas
  resources :roles
  devise_for :usuarios , :controllers => {registrations: "usuarios/registrations", sessions: "usuarios/sessions", confirmations: 'usuarios/confirmations'}
  
  devise_scope :usuario do
    get 'login', to: 'usuarios/sessions#new'
    
    authenticated :usuario do
      root to: 'home#index', as: :authenticated_root
    end
    
  end

  

  root to: 'usuarios/sessions#new'


  resources :eventualidades
  resources :turnos
  resources :horarios
  resources :dias
  resources :tipo_criterios
  resources :tipo_horarios
  resources :tipo_citas
  resources :tipo_criterio
  resources :tipo_calificaciones
  resources :tipo_evaluaciones
  resources :tipo_pagos
  resources :tipo_eventualidades
  resources :motivos
  resources :tipo_motivos
  resources :tipo_servicios
  resources :tipo_atenciones
  resources :especialistas
  resources :especialidades
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

  get "home/index"
  get "home/minor"
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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

  resources :preguntas
  resources :encuestas
end
