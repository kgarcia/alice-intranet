json.array!(@option_menus) do |option_menu|
  json.extract! option_menu, :id, :id_padre, :nombre, :url_path, :icono, :controlador, :accion, :num_hijos, :estatus
  json.url option_menu_url(option_menu, format: :json)
end
