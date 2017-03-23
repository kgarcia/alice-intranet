require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Myapp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    
    config.assets.precompile += [ 'plantilla_correos.css','configuraciones.css',  'adicciones.css', 'agenda_servicio.css', 'busquedas.css', 'calificaciones.css', 'categorias.css', 'cirugias.css', 'citas.css', 'ciudades.css', 'criterio_tipo_servicios.css', 'criterios.css', 'dias.css', 'difusiones.css', 'discapacidades.css', 'especialidades.css', 'especialistas.css', 'estado_civiles.css', 'estados.css', 'evaluaciones.css', 'eventos.css', 'eventualidades.css', 'formacion_academicas.css', 'grafico.css', 'grupo_sanguineos.css', 'habitos.css', 'horarios.css', 'informacion_generals.css', 'lesiones.css', 'medio_difusiones.css', 'motivos.css', 'nivel_formaciones.css', 'noticias.css', 'notificaciones.css', 'ocupaciones.css', 'opiniones.css', 'option_menus.css', 'paises.css', 'parentescos.css', 'patologias.css', 'perfiles.css', 'personas.css', 'profesiones.css', 'rango_edades.css', 'rango_pesos.css', 'roles.css', 'sectores.css', 'sectors.css', 'servicio_eventos.css', 'servicios.css', 'sexos.css', 'suscriptores.css', 'tipo_adicciones.css', 'tipo_atenciones.css', 'tipo_busquedas.css', 'tipo_calificaciones.css', 'tipo_cirugias.css', 'tipo_citas.css', 'tipo_criterio.css', 'tipo_criterios.css', 'tipo_difusiones.css', 'tipo_discapacidades.css', 'tipo_entidades.css', 'tipo_especialidades.css', 'tipo_evaluaciones.css', 'tipo_eventos.css', 'tipo_eventualidades.css', 'tipo_habitos.css', 'tipo_horarios.css', 'tipo_lesiones.css', 'tipo_motivos.css', 'tipo_noticias.css', 'tipo_notificaciones.css', 'tipo_opiniones.css', 'tipo_pagos.css', 'tipo_parentescos.css', 'tipo_patologias.css', 'tipo_preguntas.css', 'tipo_servicios.css', 'tipo_turnos.css', 'tipo_ubicaciones.css', 'turnos.css', 'ubicaciones.css', 'universidades.css', 'usuarios.css', 'vacunas.css' ]
    config.assets.precompile += [ 'plantilla_correos.js','configuraciones.js','style.js', 'adicciones.js',  'agenda_servicio.js',  'busquedas.js',  'calificaciones.js',  'categorias.js',  'cirugias.js',  'citas.js',  'ciudades.js',  'criterio_tipo_servicios.js',  'criterios.js',  'dias.js',  'difusiones.js',  'discapacidades.js',  'especialidades.js',  'especialistas.js',  'estado_civiles.js',  'estados.js',  'evaluaciones.js',  'eventos.js',  'eventualidades.js',  'formacion_academicas.js',  'grafico.js',  'grupo_sanguineos.js',  'habitos.js',  'horarios.js',  'informacion_generals.js',  'lesiones.js',  'medio_difusiones.js',  'motivos.js',  'nivel_formaciones.js',  'noticias.js',  'notificaciones.js',  'ocupaciones.js',  'opiniones.js',  'option_menus.js',  'paises.js',  'parentescos.js',  'patologias.js',  'perfiles.js',  'personas.js',  'profesiones.js',  'rango_edades.js',  'rango_pesos.js',  'roles.js',  'sectores.js',  'sectors.js',  'servicio_eventos.js',  'servicios.js',  'sexos.js',  'suscriptores.js',  'tipo_adicciones.js',  'tipo_atenciones.js',  'tipo_busquedas.js',  'tipo_calificaciones.js',  'tipo_cirugias.js',  'tipo_citas.js',  'tipo_criterio.js',  'tipo_criterios.js',  'tipo_difusiones.js',  'tipo_discapacidades.js',  'tipo_entidades.js',  'tipo_especialidades.js',  'tipo_evaluaciones.js',  'tipo_eventos.js',  'tipo_eventualidades.js',  'tipo_habitos.js',  'tipo_horarios.js',  'tipo_lesiones.js',  'tipo_motivos.js',  'tipo_noticias.js',  'tipo_notificaciones.js',  'tipo_opiniones.js',  'tipo_pagos.js',  'tipo_parentescos.js',  'tipo_patologias.js',  'tipo_preguntas.js',  'tipo_servicios.js',  'tipo_turnos.js',  'tipo_ubicaciones.js',  'turnos.js',  'ubicaciones.js',  'universidades.js',  'usuarios.js',  'vacunas.js' ]

  end
end
