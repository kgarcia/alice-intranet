json.array! @categorias, partial: 'categorias/categoria', as: :categoria
#json.partial! 'anidado', resource: @categorias, relations: ["tipo_servicios"]