Myapp::Application.routes.draw do

  resources :plantilla_correos
  resources :configuraciones
  resources :referencias
  get '/mi_horario', to: 'horarios#mi_horario'
  get '/usuarios/registrar', to: 'usuarios#registrar'

  post '/usuarios/guardar', to: 'usuarios#guardar'

  get '/usuarios/editar/:id', to: 'usuarios#editar'

  post '/usuarios/modificar', to: 'usuarios#modificar'

  get '/usuarios/cambiar_clave', to: 'usuarios#cambiar_clave'

  post '/usuarios/cambiar_clave', to: 'usuarios#confirmar_clave'

  delete '/usuarios/eliminar/:id', to: 'usuarios#eliminar'

  get 'grafico/tiempo_atencion'

  post 'grafico/tiempo_atencion', to: 'grafico#generar_tiempo_atencion'

  get 'grafico/tiempo_recepcion'

  post 'grafico/tiempo_recepcion', to: 'grafico#generar_tiempo_recepcion'

  get 'grafico/citas_por_turno'

  post 'grafico/citas_por_turno', to: 'grafico#generar_citas_por_turno'

  get 'grafico/satisfaccion_pacientes'

  post 'grafico/satisfaccion_pacientes', to: 'grafico#generar_satisfaccion_pacientes'

  get 'grafico/citas_solicitadas'

  post 'grafico/citas_solicitadas', to: 'grafico#generar_citas_solicitadas'

  get '/difusiones/update_entidades', to: 'difusiones#update_entidades'

  get '/grafico/update_entidades', to: 'grafico#update_entidades'

  get '/grafico/update_eventos', to: 'grafico#update_eventos'

  get '/grafico/update_servicios', to: 'grafico#update_servicios'

  get '/servicios/update_especialistas', to: 'servicios#update_especialistas'

  get '/grafico/update_servicios_por_especialidad', to: 'grafico#update_servicios_por_especialidad'

  get 'grafico/motivos_cancelacion'

  post 'grafico/motivos_cancelacion', to: 'grafico#generar_motivos_cancelacion'

  resources :suscriptores
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

  post 'usuarios/create', to: 'usuarios#create'


get 'tipo_servicios/filtrar', to: 'tipo_servicios#filtrar'
  get 'perfil', to: 'usuarios#perfil'

  post 'perfil', to: 'usuarios#actualizarPerfil'

  get 'disponibilidad', to: 'horarios#disponibilidad'

  match '/search', to: "personas#search", via: "post"
  match 'grafico/calificaciones_por_criterio', to: "grafico#generar_citas_evaluadas", via: "post"
  match 'grafico/calificaciones_por_especialidad', to: "grafico#calcular_calificaciones_por_especialidad", via: "post"
  match 'grafico/citas_por_evento', to: "grafico#calcular_citas_por_evento", via: "post"
  match 'grafico/citas_por_difusion', to: "grafico#calcular_citas_por_difusion", via: "post"
  match 'grafico/calificaciones_por_servicio', to: "grafico#calcular_calificaciones_por_servicio", via: "post"
  match 'grafico/citas_por_turno', to: "grafico#generar_citas_por_turno", via: "post"
  match 'grafico/satisfaccion_pacientes', to: "grafico#generar_satisfaccion_pacientes", via: "post"
  match 'grafico/citas_por_caracteristicas', to: "grafico#generar_citas_caracteristicas", via: "post"

  get 'grafico/generar'

  get 'grafico/citas_por_especialidad'

  get 'grafico/criterios_servicio'

  get 'grafico/citas_por_turno'

  get 'grafico/reporte_por_criterios'
  get 'grafico/calificaciones_por_criterio'
  get 'grafico/calificaciones_por_especialidad'
  get 'grafico/citas_por_evento'
  get 'grafico/citas_por_difusion'
  get 'grafico/calificaciones_por_servicio'
  get 'grafico/citas_por_caracteristicas'

  get 'agenda_servicio/', to: 'agenda_servicio#lista'

  get 'historial_cita', to: 'citas#historial'

  get 'cancelar_cita', to: 'citas#cancelar'
  get 'cancelar_cita/:id', to: 'citas#cancelarCita'
  post 'cancelar_cita', to: 'citas#confirmarCancelacion'

  put 'cancelar_movil/:id', to: 'citas#cancelar_movil'

  get 'chequear_cita', to: 'citas#chequear'
  get 'chequear_cita/:id', to: 'citas#chequearCita'
  post 'chequear_cita', to: 'citas#guardarChequearCita'

  get 'finalizar_cita', to: 'citas#finalizar'
  get 'finalizar_cita/:id', to: 'citas#finalizarCita'
  post 'finalizar_cita', to: 'citas#guardarFinalizarCita'

  get 'historico', to: 'bd_admins#historico'
  post 'finalizar_migracion', to: 'bd_admins#cambiarInformacion'

  get 'guardarback', to: 'bd_admins#guardarback'
  post 'guardarback', to: 'bd_admins#guardarback'

  get 'restauracion', to: 'bd_admins#restauration'
  post 'restauracion', to: 'bd_admins#restauration'

  get 'evaluar_cita/:id', to: 'evaluaciones#evaluarCita', as: "evaluar_cita"
  resources :tipo_turnos

  get 'cerrar_turno/:id', to: 'horarios#cerrar_turno'


  resources :informacion_generals
  resources :noticias
  resources :opiniones
  resources :tipo_opiniones
  resources :tipo_preguntas
  resources :tipo_noticias
  get 'usuarios', to: 'usuarios#index'
  get 'solicitante/:id', to: 'usuarios#solicitante'


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
  get 'login_movil', to: 'usuarios#login_movil'
  get 'login_web', to: 'usuarios#login_web'
  get 'encontrar_usuario', to: 'usuarios#encontrar_por_email'

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
