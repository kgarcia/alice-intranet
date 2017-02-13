class InsertOptionMenu < ActiveRecord::Migration[5.0]
def change

    OptionMenu.create(:id_padre => nil, :nombre => 'Configuración General',     :url_path => '#', :icono => 'fa-cogs'       ,      :controlador => '', :accion => '', num_hijos: 3, :estatus => 'A')
      OptionMenu.create(:id_padre => 1,   :nombre => 'Maestros',                :url_path => '#', :icono => 'fa-edit',           :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
      OptionMenu.create(:id_padre => 1,   :nombre => 'Parametros',              :url_path => '#', :icono => 'fa-edit', :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
      OptionMenu.create(:id_padre => 1,   :nombre => 'Otros',                   :url_path => '#', :icono => 'fa-edit',          :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
      
    OptionMenu.create(:id_padre => nil, :nombre => 'Oferta y Eventos',          :url_path => '#', :icono => 'fa-calendar',         :controlador => '', :accion => '', num_hijos: 2, :estatus => 'A')

      OptionMenu.create(:id_padre => 5,   :nombre => 'Catalogo de Servicios',   :url_path => '#', :icono => 'fa-table',           :controlador => '', :accion => '', num_hijos: 2, :estatus => 'A')
        OptionMenu.create(:id_padre => 6,   :nombre => 'Servicios',             :url_path => '#', :icono => 'fa-flask',            :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
        OptionMenu.create(:id_padre => 6,   :nombre => 'Especialistas',         :url_path => '#', :icono => 'fa-user-md',          :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
      OptionMenu.create(:id_padre => 5,   :nombre => 'Catalogo de Eventos',     :url_path => '#', :icono => 'fa-table',            :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
     
    OptionMenu.create(:id_padre => nil,   :nombre => 'Agenda',                  :url_path => '#', :icono => 'fa-calendar',         :controlador => '', :accion => '', num_hijos: 3, :estatus => 'A')
      OptionMenu.create(:id_padre => 10,  :nombre => 'Consultar',               :url_path => '#', :icono => 'fa-search',           :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
      OptionMenu.create(:id_padre => 10,  :nombre => 'Horarios',                :url_path => '#', :icono => 'fa-clock-o',          :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
      OptionMenu.create(:id_padre => 10,  :nombre => 'Eventualidades',          :url_path => '#', :icono => 'fa-exclamation-circle',           :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')


  	OptionMenu.create(:id_padre => nil, :nombre => 'Citas',                     :url_path => '#', :icono => 'fa-stethoscope',      :controlador => '', :accion => '', num_hijos: 4, :estatus => 'A')
    	OptionMenu.create(:id_padre => 14,   :nombre => 'Registrar',              :url_path => '#', :icono => 'fa-plus',           :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
      OptionMenu.create(:id_padre => 14,   :nombre => 'Consultar',              :url_path => '#', :icono => 'fa-search',           :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')    	
    	OptionMenu.create(:id_padre => 14,   :nombre => 'Historial',              :url_path => '#', :icono => 'fa-history',          :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
      OptionMenu.create(:id_padre => 14,   :nombre => 'Eventualidades',         :url_path => '#', :icono => 'fa-exclamation-circle',           :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')  	

    OptionMenu.create(:id_padre => nil,   :nombre => 'Servicio Medico',    :url_path => '#', :icono => 'fa-hospital-o', :controlador => '', :accion => '', num_hijos: 3, :estatus => 'A')
      OptionMenu.create(:id_padre => 19,   :nombre => 'Registrar Paciente',    :url_path => '#', :icono => 'fa-id-card-o', :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
    	OptionMenu.create(:id_padre => 19,   :nombre => 'Evaluar Cita',    :url_path => '#', :icono => 'fa-star-half-full', :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
      OptionMenu.create(:id_padre => 19, :nombre => 'Consultar Pacientes',               :url_path => '#', :icono => 'fa-heartbeat',        :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
   

    OptionMenu.create(:id_padre => nil, :nombre => 'Reportes',                  :url_path => '#', :icono => 'fa-bar-chart',        :controlador => '', :accion => '', num_hijos: 4, :estatus => 'A')
      OptionMenu.create(:id_padre => 23,  :nombre => 'Satisfaccion del Paciente', :url_path => '#', :icono => 'fa-file-text-o',      :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
      OptionMenu.create(:id_padre => 23,  :nombre => 'Citas Concretadas',         :url_path => '#', :icono => 'fa-pie-chart',      :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
      OptionMenu.create(:id_padre => 23,  :nombre => 'Efectos de Difusion',       :url_path => '#', :icono => 'fa-file-text-o',      :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
      OptionMenu.create(:id_padre => 23,  :nombre => 'Eventualidades',            :url_path => '#', :icono => 'fa-file-text-o',      :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
    

    OptionMenu.create(:id_padre => nil, :nombre => 'Usuarios',                   :url_path => '#', :icono => 'fa-users',             :controlador => '', :accion => '', num_hijos: 5, :estatus => 'A')
      OptionMenu.create(:id_padre => 28, :nombre => 'Registrar',               :url_path => '#', :icono => 'fa-user-plus',        :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
      OptionMenu.create(:id_padre => 28, :nombre => 'Consultar',               :url_path => '#', :icono => 'fa-search',        :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
      OptionMenu.create(:id_padre => 28, :nombre => 'Pacientes',                 :url_path => '#', :icono => 'fa-ambulance',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
      OptionMenu.create(:id_padre => 28, :nombre => 'Roles',                      :url_path => '#', :icono => 'fa-bookmark-o',        :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
      OptionMenu.create(:id_padre => 28, :nombre => 'Acciones',                   :url_path => '#', :icono => 'fa-check',            :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')

  	OptionMenu.create(:id_padre => nil, :nombre => 'Administracion Web',              :url_path => '#', :icono => 'fa-cog',              :controlador => '', :accion => '', num_hijos: 3, :estatus => 'A')
  	  OptionMenu.create(:id_padre => 34,  :nombre => 'Contenido',                       :url_path => '#', :icono => 'fa-at',               :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
      OptionMenu.create(:id_padre => 34,  :nombre => 'Imagenes',                  :url_path => '#', :icono => 'fa-desktop',          :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
  	  OptionMenu.create(:id_padre => 34,  :nombre => 'Noticias',                  :url_path => '#', :icono => 'newspaper',          :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')

##--------------MAESTROS
     OptionMenu.create(:id_padre => 2, :nombre => 'Especialista',               :url_path => '#', :icono => 'fa-heartbeat',        :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
        
##--------------PARAMETROS
      OptionMenu.create(:id_padre => 3, :nombre => 'Roles',               :url_path => '#', :icono => 'fa-heartbeat',        :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
      OptionMenu.create(:id_padre => 3, :nombre => 'Antecedentes',               :url_path => '#', :icono => 'fa-list',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
      OptionMenu.create(:id_padre => 3, :nombre => 'Habitos',                    :url_path => '#', :icono => 'fa-thumbs-up',        :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
      OptionMenu.create(:id_padre => 3,   :nombre => 'Ubicacion',                 :url_path => '#', :icono => 'fa-globe',            :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
      OptionMenu.create(:id_padre => 3, :nombre => 'Especialidad',               :url_path => '#', :icono => 'fa-heartbeat',        :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
  
    end
end
