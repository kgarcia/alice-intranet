# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#   Tipo Horario linea 390 falta agregar con los cambios que tiene marcos


    TipoEntidad.find_or_create_by(:descripcion => "Servicio")
    TipoEntidad.find_or_create_by(:descripcion => "Evento")

	Pais.find_or_create_by(descripcion: 'Venezuela', codigo: 'VE',estatus: 1)
	Pais.find_or_create_by(descripcion: 'Mexico', codigo: 'MX',estatus: 1)
	Pais.find_or_create_by(descripcion: 'Bahamas', codigo: 'BH',estatus: 1)

	Estado.find_or_create_by(descripcion: 'Amazonas',estatus: 1, :pais => Pais.find(1))
	Estado.find_or_create_by(descripcion: 'Anzoátegui',estatus: 1, :pais => Pais.find(1))
	Estado.find_or_create_by(descripcion: 'Apure',estatus: 1, :pais => Pais.find(1))
	Estado.find_or_create_by(descripcion: 'Zulia',estatus: 1, :pais => Pais.find(1))
	Estado.find_or_create_by(descripcion: 'Táchira',estatus: 1, :pais => Pais.find(1))
	Estado.find_or_create_by(descripcion: 'Mérida',estatus: 1, :pais => Pais.find(1))
    Estado.find_or_create_by(descripcion: 'Trujillo',estatus: 1, :pais => Pais.find(1))
    Estado.find_or_create_by(descripcion: 'Lara',estatus: 1, :pais => Pais.find(1))
    Estado.find_or_create_by(descripcion: 'Falcón',estatus: 1, :pais => Pais.find(1))
    Estado.find_or_create_by(descripcion: 'Yaracuy',estatus: 1, :pais => Pais.find(1))
    Estado.find_or_create_by(descripcion: 'Cojedes',estatus: 1, :pais => Pais.find(1))
    Estado.find_or_create_by(descripcion: 'Portuguesa',estatus: 1, :pais => Pais.find(1))
    Estado.find_or_create_by(descripcion: 'Barinas',estatus: 1, :pais => Pais.find(1))
    Estado.find_or_create_by(descripcion: 'Carabobo',estatus: 1, :pais => Pais.find(1))
    Estado.find_or_create_by(descripcion: 'Aragua',estatus: 1, :pais => Pais.find(1))
    Estado.find_or_create_by(descripcion: 'Distrito Capital',estatus: 1, :pais => Pais.find(1))
    Estado.find_or_create_by(descripcion: 'Miranda',estatus: 1, :pais => Pais.find(1))
    Estado.find_or_create_by(descripcion: 'Vargas',estatus: 1, :pais => Pais.find(1))
    Estado.find_or_create_by(descripcion: 'Guárico',estatus: 1, :pais => Pais.find(1))
    Estado.find_or_create_by(descripcion: 'Monagas',estatus: 1, :pais => Pais.find(1))
    Estado.find_or_create_by(descripcion: 'Sucre',estatus: 1, :pais => Pais.find(1))
    Estado.find_or_create_by(descripcion: 'Nueva Esparta',estatus: 1, :pais => Pais.find(1))
    Estado.find_or_create_by(descripcion: 'Delta Amacuro',estatus: 1, :pais => Pais.find(1))
    Estado.find_or_create_by(descripcion: 'Bolivar',estatus: 1, :pais => Pais.find(1))

    Ciudad.find_or_create_by(descripcion: 'Barquisimeto',estatus: 1, :estado => Estado.find(8))
    Ciudad.find_or_create_by(descripcion: 'Barcelona',estatus: 1, :estado => Estado.find(2))
    Ciudad.find_or_create_by(descripcion: 'San Fernando de Apure',estatus: 1, :estado => Estado.find(3))
    Ciudad.find_or_create_by(descripcion: 'Maracay',estatus: 1, :estado => Estado.find(15))
    Ciudad.find_or_create_by(descripcion: 'Barinas',estatus: 1, :estado => Estado.find(13))
    Ciudad.find_or_create_by(descripcion: 'Ciudad Bolivar',estatus: 1, :estado => Estado.find(24))
    Ciudad.find_or_create_by(descripcion: 'Valencia',estatus: 1, :estado => Estado.find(14))
    Ciudad.find_or_create_by(descripcion: 'San Carlos',estatus: 1, :estado => Estado.find(11))
    Ciudad.find_or_create_by(descripcion: 'Tucupita',estatus: 1, :estado => Estado.find(23))
    Ciudad.find_or_create_by(descripcion: 'Coro',estatus: 1, :estado => Estado.find(9))
    Ciudad.find_or_create_by(descripcion: 'San Juan de los Morros',estatus: 1, :estado => Estado.find(19))
    Ciudad.find_or_create_by(descripcion: 'Merida',estatus: 1, :estado => Estado.find(6))
    Ciudad.find_or_create_by(descripcion: 'Los Teques',estatus: 1, :estado => Estado.find(17))
    Ciudad.find_or_create_by(descripcion: 'Maturín',estatus: 1, :estado => Estado.find(20))
    Ciudad.find_or_create_by(descripcion: 'La Asuncion',estatus: 1, :estado => Estado.find(22))
    Ciudad.find_or_create_by(descripcion: 'Guanare',estatus: 1, :estado => Estado.find(12))
    Ciudad.find_or_create_by(descripcion: 'Cumana',estatus: 1, :estado => Estado.find(21))
    Ciudad.find_or_create_by(descripcion: 'San Cristobal',estatus: 1, :estado => Estado.find(5))
    Ciudad.find_or_create_by(descripcion: 'Trujillo',estatus: 1, :estado => Estado.find(7))
    Ciudad.find_or_create_by(descripcion: 'La Guaira',estatus: 1, :estado => Estado.find(18))
    Ciudad.find_or_create_by(descripcion: 'San Felipe',estatus: 1, :estado => Estado.find(10))
    Ciudad.find_or_create_by(descripcion: 'Maracaibo',estatus: 1, :estado => Estado.find(4))
    Ciudad.find_or_create_by(descripcion: 'Caracas',estatus: 1, :estado => Estado.find(16))

    Sector.find_or_create_by(:descripcion => 'El Manzano', :estatus => 1)
    Sector.find_or_create_by(:descripcion => 'Nueva Segovia', :estatus => 1)
    Sector.find_or_create_by(:descripcion => 'Bararida', :estatus => 1)
    Sector.find_or_create_by(:descripcion => 'Rosaleda', :estatus => 1)
    Sector.find_or_create_by(:descripcion => 'Centro', :estatus => 1)

    TipoUbicacion.find_or_create_by(:descripcion => 'Principal', :estatus => 1)
    TipoUbicacion.find_or_create_by(:descripcion => 'Oficina', :estatus => 1)
    TipoUbicacion.find_or_create_by(:descripcion => 'Secundaria', :estatus => 1)

    Ubicacion.find_or_create_by(:descripcion => 'Consultorio 1', :estatus => 1, :sector => Sector.find(5), :ciudad => Ciudad.find(1), :tipo_ubicacion => TipoUbicacion.find(1))
    Ubicacion.find_or_create_by(:descripcion => 'Consultorio 2', :estatus => 1, :sector => Sector.find(5), :ciudad => Ciudad.find(1), :tipo_ubicacion => TipoUbicacion.find(1))
    Ubicacion.find_or_create_by(:descripcion => 'Consultorio 3', :estatus => 1, :sector => Sector.find(5), :ciudad => Ciudad.find(1), :tipo_ubicacion => TipoUbicacion.find(1))
    Ubicacion.find_or_create_by(:descripcion => 'Av Venezuela entre 12 y 13', :estatus => 1, :sector => Sector.find(3), :ciudad => Ciudad.find(1), :tipo_ubicacion => TipoUbicacion.find(3))
    Ubicacion.find_or_create_by(:descripcion => 'Av Venezuela entre 12 y 13', :estatus => 1, :sector => Sector.find(3), :ciudad => Ciudad.find(1), :tipo_ubicacion => TipoUbicacion.find(3))
    Ubicacion.find_or_create_by(:descripcion => 'Av Venezuela entre 12 y 13', :estatus => 1, :sector => Sector.find(3), :ciudad => Ciudad.find(1), :tipo_ubicacion => TipoUbicacion.find(3))



    TipoHorario.find_or_create_by(:descripcion => 'Cantidad de pacientes', :estatus => 1)
    TipoHorario.find_or_create_by(:descripcion => 'Tiempo promedio', :estatus => 1)

    TipoEspecialidad.find_or_create_by(descripcion: 'Cardiología', estatus: 1)
    TipoEspecialidad.find_or_create_by(descripcion: 'Dermatología', estatus: 1)
    TipoEspecialidad.find_or_create_by(descripcion: 'Urología',estatus: 1)
    TipoEspecialidad.find_or_create_by(descripcion: 'Ginecología', estatus: 1)

    Especialidad.find_or_create_by(descripcion: 'Cardiología General', estatus: 1, :tipo_especialidad=> TipoEspecialidad.find(1))
    Especialidad.find_or_create_by(descripcion: 'Ecorcardíografía', estatus: 1, :tipo_especialidad => TipoEspecialidad.find(1))
    Especialidad.find_or_create_by(descripcion: 'Dermatología General', estatus: 1, :tipo_especialidad => TipoEspecialidad.find(2))
    Especialidad.find_or_create_by(descripcion: 'Cosmética', estatus: 1, :tipo_especialidad => TipoEspecialidad.find(2))
    Especialidad.find_or_create_by(descripcion: 'Urología General', estatus: 1, :tipo_especialidad => TipoEspecialidad.find(3))
    Especialidad.find_or_create_by(descripcion: 'Urología pediátrica', estatus: 1, :tipo_especialidad => TipoEspecialidad.find(3))
    Especialidad.find_or_create_by(descripcion: 'Ginecología General', estatus: 1, :tipo_especialidad => TipoEspecialidad.find(4))
    Especialidad.find_or_create_by(descripcion: 'Medicina meterno-fetal', estatus: 1, :tipo_especialidad => TipoEspecialidad.find(4))

    TipoAtencion.find_or_create_by(:descripcion => 'Especializada', :estatus => 1)
    TipoAtencion.find_or_create_by(:descripcion => 'General', :estatus => 1)

    Categoria.find_or_create_by(descripcion: 'Laboratorio',estatus: 1)
	Categoria.find_or_create_by(descripcion: 'Imagenología',estatus: 1)
	Categoria.find_or_create_by(descripcion: 'Atención Primaria en Salud',estatus: 1)

	TipoServicio.find_or_create_by(descripcion: 'Consulta de Ginecología', texto: 'Ofrece a sus pacientes un cuidado integral que incluye un amplio rango de opciones de consulta y tratamientos que comprenden desde la revisión preventiva habitual hasta las más avanzadas', foto_file_name: nil, foto_content_type: nil, foto_file_size: nil, foto_updated_at: nil, estatus: 1, :categoria => Categoria.find(3), :especialidad => Especialidad.find(7), :tipo_atencion => TipoAtencion.find(1))
    TipoServicio.find_or_create_by(descripcion: 'Consulta de Dermatología', texto: 'Cuenta con una amplia experiencia en el diagnóstico y tratamiento de las enfemedades dermatológicas', foto_file_name: nil, foto_content_type: nil, foto_file_size: nil, foto_updated_at: nil, estatus: 1, :categoria => Categoria.find(3), :especialidad => Especialidad.find(3), :tipo_atencion => TipoAtencion.find(1))
    TipoServicio.find_or_create_by(descripcion: 'Consulta de Urología', texto: 'Ofrece a sus pacientes un equipo médico, compuesto por profesionales de primer nivel, y medios diagnósticos y terapéuticos de última generación', foto_file_name: nil, foto_content_type: nil, foto_file_size: nil, foto_updated_at: nil, estatus: 1, :categoria => Categoria.find(3), :especialidad => Especialidad.find(5) ,:tipo_atencion => TipoAtencion.find(1))
    TipoServicio.find_or_create_by(descripcion: 'Consulta de Cardiología', texto:'Ofrece a sus pacientes un cuidado integral que incluye un amplio rango de opciones de consulta y tratamientos que comprenden desde la revisión preventiva habitual hasta las más avanzadas', foto_file_name: nil, foto_content_type: nil, foto_file_size: nil, foto_updated_at: nil, estatus: 1, :categoria => Categoria.find(3), :especialidad => Especialidad.find(1), :tipo_atencion => TipoAtencion.find(1))
    TipoServicio.find_or_create_by(descripcion: 'Tomografía', texto: nil, foto_file_name: nil, foto_content_type: nil, foto_file_size: nil, foto_updated_at: nil, estatus: 1, :categoria => Categoria.find(2), :especialidad => Especialidad.find(1), :tipo_atencion => TipoAtencion.find(2))
    TipoServicio.find_or_create_by(descripcion: 'Ecografía', texto: nil, foto_file_name: nil, foto_content_type: nil, foto_file_size: nil, foto_updated_at: nil, estatus: 1, :categoria => Categoria.find(2), :especialidad => Especialidad.find(2), :tipo_atencion => TipoAtencion.find(2))
    TipoServicio.find_or_create_by(descripcion: 'Exámenes', texto: nil, foto_file_name: nil, foto_content_type: nil, foto_file_size: nil, foto_updated_at: nil, estatus: 1, :categoria => Categoria.find(1), :especialidad => Especialidad.find(3), :tipo_atencion => TipoAtencion.find(2))

    TipoEvento.find_or_create_by(descripcion: 'Jornada',estatus: 1)
    TipoEvento.find_or_create_by(descripcion: 'Congreso',estatus: 1)
    TipoEvento.find_or_create_by(descripcion: 'Conferencia',estatus: 1)

    NivelFormacion.find_or_create_by(:descripcion => 'Pregrado', :estatus => 1)
    NivelFormacion.find_or_create_by(:descripcion => 'Postgrado', :estatus => 1)
    NivelFormacion.find_or_create_by(:descripcion => 'Doctorado', :estatus => 1)

    FormacionAcademica.find_or_create_by(:descripcion => 'Doctorado', :estatus => 1,:nivel_formacion => NivelFormacion.find(3))
    FormacionAcademica.find_or_create_by(:descripcion => 'Postgrado', :estatus => 1,:nivel_formacion => NivelFormacion.find(2))
    FormacionAcademica.find_or_create_by(:descripcion => 'Pregrado', :estatus => 1,:nivel_formacion => NivelFormacion.find(1))




    Universidad.find_or_create_by(:descripcion => 'Universidad Centroccidental Lisandro Alvarado - UCLA', :estatus => 1)
    Universidad.find_or_create_by(:descripcion => 'Universidad Central de Venezuela - UCV', :estatus => 1)
    Universidad.find_or_create_by(:descripcion => 'Universidad Simón Bolívar - USB', :estatus => 1)
    Universidad.find_or_create_by(:descripcion => 'Universidad Católica Andrés Bello - UCAB', :estatus => 1)
    Universidad.find_or_create_by(:descripcion => 'Universidad de los Andes - ULA', :estatus => 1)
    Universidad.find_or_create_by(:descripcion => 'Universidad del Zulia - LUZ', :estatus => 1)
    Universidad.find_or_create_by(:descripcion => 'Universidad de Carabobo - UC', :estatus => 1)
    Universidad.find_or_create_by(:descripcion => 'Universidad de Oriente - UDO', :estatus => 1)
    Universidad.find_or_create_by(:descripcion => 'Universidad Nacional Experimental Romulo Gallegos - UNERG', :estatus => 1)
    Universidad.find_or_create_by(:descripcion => 'Universidad Nacional Experimental Francisco Miranda - UNEFM', :estatus => 1)

    Dia.find_or_create_by(:descripcion => 'Lunes', :estatus => 1)
    Dia.find_or_create_by(:descripcion => 'Martes', :estatus => 1)
    Dia.find_or_create_by(:descripcion => 'Miércoles', :estatus => 1)
    Dia.find_or_create_by(:descripcion => 'Jueves', :estatus => 1)
    Dia.find_or_create_by(:descripcion => 'Viernes', :estatus => 1)
    Dia.find_or_create_by(:descripcion => 'Sábado', :estatus => 1)
    Dia.find_or_create_by(:descripcion => 'Domingo', :estatus => 1)

    TipoTurno.find_or_create_by(:descripcion => "Mañana")
    TipoTurno.find_or_create_by(:descripcion => "Tarde")

    TipoEventualidad.find_or_create_by(:descripcion => 'Clínica', :estatus => 1)
    TipoEventualidad.find_or_create_by(:descripcion => 'Responsable', :estatus => 1)
    TipoEventualidad.find_or_create_by(:descripcion => 'Individual', :estatus => 1)

    TipoMotivo.find_or_create_by(:descripcion => 'Operativo', :estatus => 1)
    TipoMotivo.find_or_create_by(:descripcion => 'Salud', :estatus => 1)
    TipoMotivo.find_or_create_by(:descripcion => 'Personal', :estatus => 1)
    TipoMotivo.find_or_create_by(:descripcion => 'Otro', :estatus => 1)

    Motivo.find_or_create_by(:descripcion => 'Fumigación', :estatus => 1, :tipo_motivo => TipoMotivo.find(1))
    Motivo.find_or_create_by(:descripcion => 'Enfermedad', :estatus => 1, :tipo_motivo => TipoMotivo.find(2))
    Motivo.find_or_create_by(:descripcion => 'Compromiso Familiar', :estatus => 1, :tipo_motivo => TipoMotivo.find(3))

    TipoCriterio.find_or_create_by(descripcion: 'Atención Médica',estatus: 1)
    TipoCriterio.find_or_create_by(descripcion: 'Servicio',estatus: 1)

    Criterio.find_or_create_by(descripcion: 'Puntualidad',estatus: 1, :tipo_criterio => TipoCriterio.find(1))
    Criterio.find_or_create_by(descripcion: 'Amabilidad',estatus: 1, :tipo_criterio => TipoCriterio.find(1))
    Criterio.find_or_create_by(descripcion: 'Comodidad',estatus: 1, :tipo_criterio => TipoCriterio.find(1))
    Criterio.find_or_create_by(descripcion: 'Calidad',estatus: 1, :tipo_criterio => TipoCriterio.find(2))

    TipoPago.find_or_create_by(:descripcion => 'Efectivo', :estatus => 1)
    TipoPago.find_or_create_by(:descripcion => 'Débito', :estatus => 1)
    TipoPago.find_or_create_by(:descripcion => 'Crédito', :estatus => 1)
    TipoPago.find_or_create_by(:descripcion => 'Seguro', :estatus => 1)

    TipoAdiccion.find_or_create_by(descripcion: 'Química',estatus: 1)
    TipoAdiccion.find_or_create_by(descripcion: 'Conductuales',estatus: 1)

	Adiccion.find_or_create_by(descripcion: 'Tabaco',estatus: 1, tipo_adiccion: TipoAdiccion.find(1))
	Adiccion.find_or_create_by(descripcion: 'Alcohol',estatus: 1, tipo_adiccion: TipoAdiccion.find(1))
	Adiccion.find_or_create_by(descripcion: 'Café',estatus: 1, tipo_adiccion: TipoAdiccion.find(1))
	Adiccion.find_or_create_by(descripcion: 'Drogas',estatus: 1, tipo_adiccion: TipoAdiccion.find(1))
	Adiccion.find_or_create_by(descripcion: 'Lodupatía',estatus: 1, tipo_adiccion: TipoAdiccion.find(2))
	Adiccion.find_or_create_by(descripcion: 'Ciberadicción',estatus: 1, tipo_adiccion: TipoAdiccion.find(2))

	TipoCirugia.find_or_create_by(descripcion: 'Plástica',estatus: 1)
	TipoCirugia.find_or_create_by(descripcion: 'Cardiovascular',estatus: 1)
	TipoCirugia.find_or_create_by(descripcion: 'Pediátrica',estatus: 1)

	Cirugia.find_or_create_by(descripcion: 'Rinoplastia',estatus: 1, :tipo_cirugia => TipoCirugia.find(1))
	Cirugia.find_or_create_by(descripcion: 'Valvular',estatus: 1, :tipo_cirugia => TipoCirugia.find(2))
	Cirugia.find_or_create_by(descripcion: 'Circuncisión',estatus: 1, :tipo_cirugia => TipoCirugia.find(3))
	Cirugia.find_or_create_by(descripcion: 'Hernia inguinal',estatus: 1, :tipo_cirugia => TipoCirugia.find(3))


	TipoDiscapacidad.find_or_create_by(descripcion: 'Física',estatus: 1)
	TipoDiscapacidad.find_or_create_by(descripcion: 'Sensorial',estatus: 1)
	TipoDiscapacidad.find_or_create_by(descripcion: 'Intelectual',estatus: 1)


    Discapacidad.find_or_create_by(descripcion: 'Parálisis Celebral',estatus: 1, :tipo_discapacidad => TipoDiscapacidad.find(1))
    Discapacidad.find_or_create_by(descripcion: 'Auditiva',estatus: 1, :tipo_discapacidad => TipoDiscapacidad.find(2))
    Discapacidad.find_or_create_by(descripcion: 'Visual',estatus: 1, :tipo_discapacidad => TipoDiscapacidad.find(2))
    Discapacidad.find_or_create_by(descripcion: 'Problema de lecto-escritura',estatus: 1, :tipo_discapacidad => TipoDiscapacidad.find(3))
    Discapacidad.find_or_create_by(descripcion: 'Dificultad para razonar',estatus: 1, :tipo_discapacidad => TipoDiscapacidad.find(3))

    EstadoCivil.find_or_create_by(descripcion: 'Soltero/a',estatus: 1)
    EstadoCivil.find_or_create_by(descripcion: 'Casado/a',estatus: 1)
    EstadoCivil.find_or_create_by(descripcion: 'Divorciado/a',estatus: 1)
    EstadoCivil.find_or_create_by(descripcion: 'Viudo/a',estatus: 1)

    GrupoSanguineo.find_or_create_by(:descripcion => 'A', :estatus => 1)
    GrupoSanguineo.find_or_create_by(:descripcion => 'B', :estatus => 1)
    GrupoSanguineo.find_or_create_by(:descripcion => 'AB', :estatus => 1)
    GrupoSanguineo.find_or_create_by(:descripcion => 'O', :estatus => 1)

    TipoHabito.find_or_create_by(descripcion: 'Fisicos',estatus: 1)
	TipoHabito.find_or_create_by(descripcion: 'Alimentación',estatus: 1)

	Habito.find_or_create_by(descripcion: 'Trotar',estatus: 1,:tipo_habito => TipoHabito.find(1))
	Habito.find_or_create_by(descripcion: 'Caminar',estatus: 1,:tipo_habito => TipoHabito.find(1))
	Habito.find_or_create_by(descripcion: 'Actividad Física',estatus: 1,:tipo_habito => TipoHabito.find(1))
	Habito.find_or_create_by(descripcion: 'Alimentación Balanceada',estatus: 1,:tipo_habito => TipoHabito.find(2))
	Habito.find_or_create_by(descripcion: 'Consumo de Carnes Rojas',estatus: 1,:tipo_habito => TipoHabito.find(2))
	Habito.find_or_create_by(descripcion: 'Consumo de Comida Rápida',estatus: 1,:tipo_habito => TipoHabito.find(2))


    TipoLesion.find_or_create_by(descripcion: 'Articulares',estatus: 1)
	TipoLesion.find_or_create_by(descripcion: 'Musculares',estatus: 1)

	Lesion.find_or_create_by(descripcion: 'Contusión',estatus: 1,:tipo_lesion => TipoLesion.find(1))
	Lesion.find_or_create_by(descripcion: 'Esguince',estatus: 1,:tipo_lesion => TipoLesion.find(1))
    Lesion.find_or_create_by(descripcion: 'Contractura',estatus: 1,:tipo_lesion => TipoLesion.find(2))
    Lesion.find_or_create_by(descripcion: 'Desgarro',estatus: 1,:tipo_lesion => TipoLesion.find(2))

    Ocupacion.find_or_create_by(descripcion: 'Estudiante',estatus: 1)
    Ocupacion.find_or_create_by(descripcion: 'Ama de Casa',estatus: 1)
    Ocupacion.find_or_create_by(descripcion: 'Obrero',estatus: 1)
    Ocupacion.find_or_create_by(descripcion: 'Chofer',estatus: 1)

    TipoParentesco.find_or_create_by(:descripcion => 'Hijo/a', :estatus => 1)
    TipoParentesco.find_or_create_by(:descripcion => 'Nieto/a', :estatus => 1)
    TipoParentesco.find_or_create_by(:descripcion => 'Bisnieto/a', :estatus => 1)
    TipoParentesco.find_or_create_by(:descripcion => 'Padre', :estatus => 1)
    TipoParentesco.find_or_create_by(:descripcion => 'Madre', :estatus => 1)
    TipoParentesco.find_or_create_by(:descripcion => 'Abuelo/a', :estatus => 1)
    TipoParentesco.find_or_create_by(:descripcion => 'Tio/a', :estatus => 1)
    TipoParentesco.find_or_create_by(:descripcion => 'Bisabuelo/a', :estatus => 1)
    TipoParentesco.find_or_create_by(:descripcion => 'Hermano/a', :estatus => 1)
    TipoParentesco.find_or_create_by(:descripcion => 'Esposo/a', :estatus => 1)

    TipoPatologia.find_or_create_by(descripcion: 'Renales',estatus: 1)
	TipoPatologia.find_or_create_by(descripcion: 'Respiratorias',estatus: 1)
	TipoPatologia.find_or_create_by(descripcion: 'Mentales',estatus: 1)
	TipoPatologia.find_or_create_by(descripcion: 'Cardiovasculares',estatus: 1)
	TipoPatologia.find_or_create_by(descripcion: 'infantiles',estatus: 1)

    Patologia.find_or_create_by(:descripcion => 'Cálculo', :estatus => 1, :tipo_patologia => TipoPatologia.find(1))
    Patologia.find_or_create_by(:descripcion => 'Asma', :estatus => 1, :tipo_patologia => TipoPatologia.find(2))
    Patologia.find_or_create_by(:descripcion => 'Bronquitis', :estatus => 1, :tipo_patologia => TipoPatologia.find(2))
    Patologia.find_or_create_by(:descripcion => 'Neumonía', :estatus => 1, :tipo_patologia => TipoPatologia.find(2))
    Patologia.find_or_create_by(:descripcion => 'Neurosis', :estatus => 1, :tipo_patologia => TipoPatologia.find(3))
    Patologia.find_or_create_by(:descripcion => 'Trastorno Depresivos', :estatus => 1, :tipo_patologia => TipoPatologia.find(3))
    Patologia.find_or_create_by(:descripcion => 'Esquizofrenia', :estatus => 1, :tipo_patologia => TipoPatologia.find(3))
    Patologia.find_or_create_by(:descripcion => 'Infarto de miocardio', :estatus => 1, :tipo_patologia => TipoPatologia.find(4))
    Patologia.find_or_create_by(:descripcion => 'Cardiopatía', :estatus => 1, :tipo_patologia => TipoPatologia.find(4))

    Profesion.find_or_create_by(:descripcion => 'Medicina', :estatus => 1)
    Profesion.find_or_create_by(:descripcion => 'Ingeniería', :estatus => 1)
    Profesion.find_or_create_by(:descripcion => 'Arquitectura', :estatus => 1)
    Profesion.find_or_create_by(:descripcion => 'Educación', :estatus => 1)
    Profesion.find_or_create_by(:descripcion => 'Humanidades', :estatus => 1)
    Profesion.find_or_create_by(:descripcion => 'Economía', :estatus => 1)
    Profesion.find_or_create_by(:descripcion => 'Contaduría', :estatus => 1)
    Profesion.find_or_create_by(:descripcion => 'Administración', :estatus => 1)

    RangoEdad.find_or_create_by(:descripcion => 'Niño', :edad_inicial => 0, :edad_final => 8,:estatus => 1)
    RangoEdad.find_or_create_by(:descripcion => 'Adolescente', :edad_inicial => 9, :edad_final => 19,:estatus => 1)
    RangoEdad.find_or_create_by(:descripcion => 'Adulto', :edad_inicial => 20, :edad_final => 50,:estatus => 1)
    RangoEdad.find_or_create_by(:descripcion => 'Adulto Mayor', :edad_inicial => 51, :edad_final => 100,:estatus => 1)

    RangoPeso.find_or_create_by(:descripcion => 'Peso Saludable', :peso_inicial => 0, :peso_final => 70,:estatus => 1)
    RangoPeso.find_or_create_by(:descripcion => 'Sobrepeso', :peso_inicial => 70, :peso_final => 90,:estatus => 1)
    RangoPeso.find_or_create_by(:descripcion => 'Obesidad', :peso_inicial => 100, :peso_final => 120,:estatus => 1)

	Sexo.find_or_create_by(:descripcion => 'Masculino', :estatus => 1)
    Sexo.find_or_create_by(:descripcion => 'Femenino', :estatus => 1)

    Vacuna.find_or_create_by(descripcion: 'Fiebre Amarilla',estatus: 1)
	Vacuna.find_or_create_by(descripcion: 'Dengue',estatus: 1)
	Vacuna.find_or_create_by(descripcion: 'Sarampión',estatus: 1)
	Vacuna.find_or_create_by(descripcion: 'Colera',estatus: 1)
	Vacuna.find_or_create_by(descripcion: 'Hepatitis A',estatus: 1)
	Vacuna.find_or_create_by(descripcion: 'Rubeola',estatus: 1)


    Persona.find_or_create_by(:cedula => '20473293', :nombre => 'Richard', :apellido => 'Gere', :telefono => '+584245126060', :direccion => 'Urb. Bararida Residencias Venezuela II Etapa', :fecha_nacimiento => '16/05/1991', :sexo => Sexo.find(1))
    Persona.find_or_create_by(:cedula => '20473294', :nombre => 'Demon', :apellido => 'Sars', :telefono => '+584249047270', :direccion => 'Urb. Colinas de Perija', :fecha_nacimiento => '16/02/1964', :sexo => Sexo.find(1))
    Persona.find_or_create_by(:cedula => '20473295', :nombre => 'Antonio', :apellido => 'Trap', :telefono => '+584248749267', :direccion => 'Urb. Altavista', :fecha_nacimiento => '27/09/1982', :sexo => Sexo.find(1))
    Persona.find_or_create_by(:cedula => '20473296', :nombre => 'Geremy Swarch', :apellido => 'Strauss', :telefono => '+584248888218', :direccion => 'Calle 33 entre carreras 15 y 16 casa V-22', :fecha_nacimiento => '14/12/1991', :sexo => Sexo.find(1))
    Persona.find_or_create_by(:cedula => '20473297', :nombre => 'Lina Vrin', :apellido => 'Faraushan', :telefono => '+584249837262', :direccion => 'Fraccionamiento Villas Mediterraneas', :fecha_nacimiento => '28/06/1980', :sexo => Sexo.find(1))
    Persona.find_or_create_by(:cedula => '20473298', :nombre => 'Girly', :apellido => 'Six', :telefono => '+584245938273', :direccion => 'Urb. Midtown Manhattan', :fecha_nacimiento => '16/05/1991', :sexo => Sexo.find(2))
    Persona.find_or_create_by(:cedula => '20473299', :nombre => 'Riana', :apellido => 'Mic', :telefono => '+584245927273', :direccion => 'Urb. Concordia', :fecha_nacimiento => '23/05/1980', :sexo => Sexo.find(2))
    Persona.find_or_create_by(:cedula => '204732910', :nombre => 'Marck', :apellido => 'Stuar', :telefono => '+5842459382313', :direccion => 'Urb. Rosaleda', :fecha_nacimiento => '16/05/1991', :sexo => Sexo.find(1))
    Persona.find_or_create_by(:cedula => '204732911', :nombre => 'Nina', :apellido => 'Marroni', :telefono => '+584245931111', :direccion => 'Centro', :fecha_nacimiento => '16/05/1921', :sexo => Sexo.find(2))
    Persona.find_or_create_by(:cedula => '204732912', :nombre => 'Torstar', :apellido => 'Garg', :telefono => '+584245938523', :direccion => 'Urb. Av 20 con calle 18', :fecha_nacimiento => '13/05/1954', :sexo => Sexo.find(1))
    Persona.find_or_create_by(:cedula => '204732913', :nombre => 'Lily', :apellido => 'Mendina', :telefono => '+584245938192', :direccion => 'Urb. Montalban', :fecha_nacimiento => '20/08/1989', :sexo => Sexo.find(2))
    Persona.find_or_create_by(:cedula => '204732914', :nombre => 'Tomas', :apellido => 'Garber', :telefono => '+584242635479', :direccion => 'Urb. Hato Arriba', :fecha_nacimiento => '31/12/2000', :sexo => Sexo.find(1))
    # Personas
    # Juan Pérez (Solicitante y Paciente)
    Persona.find_or_create_by(:cedula => '10787657', :nombre => 'Juan', :apellido => 'Pérez' , :telefono => '+584120583093', :direccion => 'Urb. Nueva Segovia', :fecha_nacimiento => '12/06/1970', :sexo => Sexo.find(1))
    Persona.find_or_create_by(:cedula => '5677678', :nombre => 'Carlos', :apellido => 'Berríos' , :telefono => '+582514567890', :direccion => 'Cabudare Centro', :fecha_nacimiento => '03/01/1955', :sexo => Sexo.find(1))
    Persona.find_or_create_by(:cedula => '18090153', :nombre => 'Patricia', :apellido => 'Solano' , :telefono => '+584140908876', :direccion => 'Urb. Obelisco', :fecha_nacimiento => '10/08/1988', :sexo => Sexo.find(2))

    Especialista.find_or_create_by(:persona => Persona.find(1), estatus: 1)
    Especialista.find_or_create_by(:persona => Persona.find(2), estatus: 1)
    Especialista.find_or_create_by(:persona => Persona.find(3), estatus: 1)
    Especialista.find_or_create_by(:persona => Persona.find(14), estatus: 1)

    EspecialidadEspecialista.find_or_create_by(:especialidad => Especialidad.find(1), :especialista => Especialista.find(1))
    EspecialidadEspecialista.find_or_create_by(:especialidad => Especialidad.find(2), :especialista => Especialista.find(2))
    EspecialidadEspecialista.find_or_create_by(:especialidad => Especialidad.find(3), :especialista => Especialista.find(3))
    EspecialidadEspecialista.find_or_create_by(:especialidad => Especialidad.find(4), :especialista => Especialista.find(4))


    Servicio.find_or_create_by(descripcion: 'Consulta cardiológica ritmo alterado', :ubicacion => Ubicacion.find(3), :tipo_servicio => TipoServicio.find(4), :especialista => Especialista.find(1), :estatus => 1, foto_file_name: nil, foto_content_type: nil, foto_file_size: nil, foto_updated_at: nil, precio: 25000)
    Servicio.find_or_create_by(descripcion: 'Consulta general', :ubicacion => Ubicacion.find(3), :tipo_servicio => TipoServicio.find(1), :especialista => Especialista.find(3), :estatus => 1, foto_file_name: nil, foto_content_type: nil, foto_file_size: nil, foto_updated_at: nil, precio: 13614)
    Servicio.find_or_create_by(descripcion: 'Tomografía  axial', :ubicacion => Ubicacion.find(3), :tipo_servicio => TipoServicio.find(5), :especialista => Especialista.find(1), :estatus => 1, foto_file_name: nil, foto_content_type: nil, foto_file_size: nil, foto_updated_at: nil, precio: 25000)
    Servicio.find_or_create_by(descripcion: 'Ecografía Abdominal', :ubicacion => Ubicacion.find(3), :tipo_servicio => TipoServicio.find(6), :especialista => Especialista.find(3), :estatus => 1, foto_file_name: nil, foto_content_type: nil, foto_file_size: nil, foto_updated_at: nil, precio: 13614)
    Servicio.find_or_create_by(descripcion: 'Examen de orina', :ubicacion => Ubicacion.find(2), :tipo_servicio => TipoServicio.find(7), :especialista => Especialista.find(3), :estatus => 1, foto_file_name: nil, foto_content_type: nil, foto_file_size: nil, foto_updated_at: nil, precio: 45989)
    Servicio.find_or_create_by(descripcion: 'Hematología Completa', :ubicacion => Ubicacion.find(3), :tipo_servicio => TipoServicio.find(7), :especialista => Especialista.find(3), :estatus => 1, foto_file_name: nil, foto_content_type: nil, foto_file_size: nil, foto_updated_at: nil, precio: 50555.55)

    Eventualidad.find_or_create_by(:descripcion => 'Cierre de la clínica', :estatus => 1, :tipo_eventualidad_id => 1, :motivo => Motivo.find(1), fecha_inicio: '01/03/2017', fecha_fin: '01/03/2017')
    Eventualidad.find_or_create_by(:descripcion => 'Cancelación de cita', :estatus => 1, :tipo_eventualidad_id => 3, :motivo=> Motivo.find(2), fecha_inicio: '01/03/2017', fecha_fin: '01/03/2017')

    TipoCita.find_or_create_by(:descripcion => 'Chequeo', :estatus => 1)
    TipoCita.find_or_create_by(:descripcion => 'Entrega de Exámenes', :estatus => 1)
    TipoCita.find_or_create_by(:descripcion => 'Control', :estatus => 1)

    Cita.find_or_create_by(:turno => Turno.find(1), :persona => Persona.find(4), :usuario_id => nil, :fecha => '2/09/2016', :tipo_pago_id => TipoPago.find(1).id, :eventualidad_id => nil, estatus: 1, :tipo_cita => TipoCita.find(1))
    Cita.find_or_create_by(:turno => Turno.find(1), :persona => Persona.find(5), :usuario_id => nil, :fecha => '12/09/2016', :tipo_pago_id => TipoPago.find(1).id, :eventualidad_id => nil, estatus: 1, :tipo_cita => TipoCita.find(2))
    Cita.find_or_create_by(:turno => Turno.find(1), :persona => Persona.find(6), :usuario_id => nil, :fecha => '12/09/2016', :tipo_pago_id => TipoPago.find(2).id, :eventualidad_id => Eventualidad.find(2).id, estatus: 1, :tipo_cita => TipoCita.find(3))
    Cita.find_or_create_by(:turno => Turno.find(4), :persona => Persona.find(7), :usuario_id => nil, :fecha => '12/09/2016', :tipo_pago_id => TipoPago.find(1).id, :eventualidad_id => nil, estatus: 1, :tipo_cita => TipoCita.find(1))
    Cita.find_or_create_by(:turno => Turno.find(4), :persona => Persona.find(8), :usuario_id => nil, :fecha => '12/09/2016', :tipo_pago_id => TipoPago.find(3).id, :eventualidad_id => nil, estatus: 1, :tipo_cita => TipoCita.find(2))
    Cita.find_or_create_by(:turno => Turno.find(4), :persona => Persona.find(9), :usuario_id => nil, :fecha => '12/09/2016', :tipo_pago_id => TipoPago.find(1).id, :eventualidad_id => nil, estatus: 1, :tipo_cita => TipoCita.find(3))
    Cita.find_or_create_by(:turno => Turno.find(4), :persona => Persona.find(10), :usuario_id => nil, :fecha => '12/09/2016', :tipo_pago_id => TipoPago.find(2).id, :eventualidad_id => nil, estatus: 1, :tipo_cita => TipoCita.find(1))
    Cita.find_or_create_by(:turno => Turno.find(4), :persona => Persona.find(11), :usuario_id => nil, :fecha => '12/09/2016', :tipo_pago_id => TipoPago.find(1).id, :eventualidad_id => nil, estatus: 1, :tipo_cita => TipoCita.find(2))
    Cita.find_or_create_by(:turno => Turno.find(4), :persona => Persona.find(12), :usuario_id => nil, :fecha => '12/09/2016', :tipo_pago_id => TipoPago.find(4).id, :eventualidad_id => nil, estatus: 1, :tipo_cita => TipoCita.find(3))


    TipoCalificacion.find_or_create_by(:descripcion => 'Numérica', :estatus => 1)
    TipoCalificacion.find_or_create_by(:descripcion => 'Texto', :estatus => 1)
    TipoCalificacion.find_or_create_by(:descripcion => 'Lista', :estatus => 1)


    Rol.find_or_create_by(descripcion: 'Dueño')
    Rol.find_or_create_by(descripcion: 'Especialista')
    Rol.find_or_create_by(descripcion: 'Recepcionista')
    Rol.find_or_create_by(descripcion: 'Paciente')
    Rol.find_or_create_by(descripcion: 'Seguridad')
    
	OptionMenu.find_or_create_by(        :id_padre => nil, :nombre => 'Configuración General',     :url_path => '#', :icono => 'fa-cogs'       ,      :controlador => '', :accion => '', num_hijos: 3, :estatus => 'A')
    	OptionMenu.find_or_create_by(    :id_padre => 1,   :nombre => 'Datos de Servicios',                :url_path => '#', :icono => 'fa-edit',           :controlador => '', :accion => '', num_hijos: 15, :estatus => 'A')

		    OptionMenu.find_or_create_by(:id_padre => 2, :nombre => 'Países',                   :url_path => '/paises', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
		    OptionMenu.find_or_create_by(:id_padre => 2, :nombre => 'Estados',                   :url_path => '/estados', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
		    OptionMenu.find_or_create_by(:id_padre => 2, :nombre => 'Ciudades',                   :url_path => '/ciudades', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
		    OptionMenu.find_or_create_by(:id_padre => 2, :nombre => 'Sectores',                   :url_path => '/sectores', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
		    OptionMenu.find_or_create_by(:id_padre => 2, :nombre => 'Tipos de Ubicación',                   :url_path => '/tipo_ubicaciones', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
		    OptionMenu.find_or_create_by(:id_padre => 2, :nombre => 'Ubicaciones',                   :url_path => '/ubicaciones', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
		    OptionMenu.find_or_create_by(:id_padre => 2, :nombre => 'Tipo Especialidades',                   :url_path => '/tipo_especialidades', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
		    OptionMenu.find_or_create_by(:id_padre => 2, :nombre => 'Especialidades',                   :url_path => '/especialidades', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
		    OptionMenu.find_or_create_by(:id_padre => 2, :nombre => 'Tipos de Atención',                   :url_path => '/tipo_atenciones', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
		    OptionMenu.find_or_create_by(:id_padre => 2, :nombre => 'Categorías',                   :url_path => '/categorias', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
		    OptionMenu.find_or_create_by(:id_padre => 2, :nombre => 'Tipos de Servicio',                   :url_path => '/tipo_servicios', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
		    OptionMenu.find_or_create_by(:id_padre => 2, :nombre => 'Tipos de Evento',                   :url_path => '/tipo_eventos', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
		    OptionMenu.find_or_create_by(:id_padre => 2, :nombre => 'Nivel de Formación',                   :url_path => '/nivel_formaciones', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
		    OptionMenu.find_or_create_by(:id_padre => 2, :nombre => 'Universidades',                   :url_path => '/universidades', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
    	OptionMenu.find_or_create_by(    :id_padre => 1,   :nombre => 'Datos de Agendas y Citas',              :url_path => '#', :icono => 'fa-edit', :controlador => '', :accion => '', num_hijos: 12, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 17, :nombre => 'Días',                   :url_path => '/dias', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 17, :nombre => 'Tipos de Turno',                   :url_path => '/tipo_turnos', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
			OptionMenu.find_or_create_by(:id_padre => 17, :nombre => 'Turnos',                   :url_path => '/turnos', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
			OptionMenu.find_or_create_by(:id_padre => 17, :nombre => 'Tipos de Eventualidad',                   :url_path => '/tipo_eventualidades', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 17, :nombre => 'Tipos de Motivo',                   :url_path => '/tipo_motivos', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 17, :nombre => 'Motivos',                   :url_path => '/motivos', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 17, :nombre => 'Tipos de Criterio',                   :url_path => '/tipo_criterios', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 17, :nombre => 'Criterios',                   :url_path => '/criterios', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
    		OptionMenu.find_or_create_by(:id_padre => 17, :nombre => 'Tipos de Pago',                   :url_path => '/tipo_pagos', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
            OptionMenu.find_or_create_by(:id_padre => 17, :nombre => 'Tipos de Cita',                   :url_path => '/tipo_citas', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
    	OptionMenu.find_or_create_by(    :id_padre => 1,   :nombre => 'Datos de Segmentación',                   :url_path => '#', :icono => 'fa-edit',          :controlador => '', :accion => '', num_hijos: 21, :estatus => 'A')
          	OptionMenu.find_or_create_by(:id_padre => 28, :nombre => 'Tipos de Adicción',                   :url_path => '/tipo_adicciones', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 28, :nombre => 'Adicciones',                   :url_path => '/adicciones', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 28, :nombre => 'Tipos de Cirugía',                   :url_path => '/tipo_cirugias', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 28, :nombre => 'Cirugías',                   :url_path => '/cirugias', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 28, :nombre => 'Tipos de Discapacidad',                   :url_path => '/tipo_discapacidades', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 28, :nombre => 'Discapacidades',                   :url_path => '/discapacidades', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 28, :nombre => 'Estado Civil',                   :url_path => '/estado_civiles', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 28, :nombre => 'Grupos Sanguíneos',                   :url_path => '/grupo_sanguineos', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 28, :nombre => 'Tipos de Hábito',                   :url_path => '/tipo_habitos', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 28, :nombre => 'Hábitos',                   :url_path => '/habitos', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 28, :nombre => 'Tipos de Lesión',                   :url_path => '/tipo_lesiones', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 28, :nombre => 'Lesiones',                   :url_path => '/lesiones', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 28, :nombre => 'Ocupaciones',                   :url_path => '/ocupaciones', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 28, :nombre => 'Tipos de Parentesco',                   :url_path => '/tipo_parentescos', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 28, :nombre => 'Tipos de Patologías',                   :url_path => '/tipo_patologias', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 28, :nombre => 'Patologías',                   :url_path => '/patologias', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 28, :nombre => 'Profesiones',                   :url_path => '/profesiones', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 28, :nombre => 'Rangos de Edad',                   :url_path => '/rango_edades', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 28, :nombre => 'Rangos de Peso',                   :url_path => '/rango_pesos', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 28, :nombre => 'Sexo',                   :url_path => '/sexos', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 28, :nombre => 'Vacunas',                   :url_path => '/vacunas', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 28, :nombre => 'Perfiles',                   :url_path => '/perfiles',:icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
    
    OptionMenu.find_or_create_by(        :id_padre => nil, :nombre => 'Servicios y Eventos',          :url_path => '#', :icono => 'fa-calendar',         :controlador => '', :accion => '', num_hijos: 2, :estatus => 'A')
		OptionMenu.find_or_create_by(    :id_padre => 51,   :nombre => 'Catálogo de Servicios',   :url_path => '#', :icono => 'fa-table',           :controlador => '', :accion => '', num_hijos: 2, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 52,   :nombre => 'Servicios',             :url_path => '/servicios', :icono => 'fa-flask',            :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 52,   :nombre => 'Especialistas',         :url_path => '/especialistas', :icono => 'fa-user-md',          :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')

  		OptionMenu.find_or_create_by(    :id_padre => 51,   :nombre => 'Catálogo de Eventos',     :url_path => '/eventos', :icono => 'fa-table',            :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')

    OptionMenu.find_or_create_by(        :id_padre => nil,   :nombre => 'Agenda',                  :url_path => '#', :icono => 'fa-calendar',         :controlador => '', :accion => '', num_hijos: 3, :estatus => 'A')
	    OptionMenu.find_or_create_by(    :id_padre => 56,  :nombre => 'Mi Horario',               :url_path => '/mi_horario', :icono => 'fa-search',           :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	    OptionMenu.find_or_create_by(    :id_padre => 56,  :nombre => 'Horarios',                :url_path => '/horarios', :icono => 'fa-clock-o',          :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	    OptionMenu.find_or_create_by(    :id_padre => 56,  :nombre => 'Eventualidades',          :url_path => '/eventualidades', :icono => 'fa-exclamation-circle',           :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')

    OptionMenu.find_or_create_by(        :id_padre => nil,   :nombre => 'Servicios Médicos',    :url_path => '#', :icono => 'fa-hospital-o', :controlador => '', :accion => '', num_hijos: 3, :estatus => 'A')
        OptionMenu.find_or_create_by(    :id_padre => 60,   :nombre => 'Confirmar Cita',    :url_path => '/chequear_cita', :icono => 'fa-id-card-o', :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
    	OptionMenu.find_or_create_by(    :id_padre => 60,   :nombre => 'Atender Cita',    :url_path => '/finalizar_cita', :icono => 'fa-id-card-o', :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')

    OptionMenu.find_or_create_by(        :id_padre => nil, :nombre => 'Reportes Estadísticos',   :url_path => '#', :icono => 'fa-bar-chart',        :controlador => '', :accion => '', num_hijos: 12, :estatus => 'A')
	    OptionMenu.find_or_create_by(    :id_padre => 63, :nombre => 'Citas por Estatus',                   :url_path => '/grafico/citas_solicitadas', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	    OptionMenu.find_or_create_by(    :id_padre => 63, :nombre => 'Tiempo Promedio de Solicitud',                   :url_path => '/grafico/tiempo_solicitud', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	    OptionMenu.find_or_create_by(    :id_padre => 63, :nombre => 'Tiempo Promedio de Recepción',                   :url_path => '/grafico/tiempo_recepcion', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
        OptionMenu.find_or_create_by(    :id_padre => 63, :nombre => 'Tiempo Promedio de Atención',                   :url_path => '/grafico/tiempo_atencion', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
        OptionMenu.find_or_create_by(    :id_padre => 63, :nombre => 'Tiempo Promedio de Evaluación',                   :url_path => '/grafico/tiempo_evaluacion', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
        OptionMenu.find_or_create_by(    :id_padre => 63, :nombre => 'Motivos de Cancelación',                   :url_path => '/grafico/motivos_cancelacion', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
        OptionMenu.find_or_create_by(    :id_padre => 63, :nombre => 'Calificaciones por Especialidades',                   :url_path => '/grafico/calificaciones_por_especialidad', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
        OptionMenu.find_or_create_by(    :id_padre => 63, :nombre => 'Calificaciones por Servicio',                   :url_path => '/grafico/calificaciones_por_servicio', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
        OptionMenu.find_or_create_by(    :id_padre => 63, :nombre => 'Calificaciones por Criterio',                   :url_path => '/grafico/calificaciones_por_criterio', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
        OptionMenu.find_or_create_by(    :id_padre => 63, :nombre => 'Efectividad de Eventos',                   :url_path => '/grafico/citas_por_evento', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
        OptionMenu.find_or_create_by(    :id_padre => 63, :nombre => 'Efectividad de Difusión',                   :url_path => '/grafico/citas_por_evento', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
        OptionMenu.find_or_create_by(    :id_padre => 63, :nombre => 'Opiniones',                   :url_path => '/grafico/opiniones', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')

	OptionMenu.find_or_create_by(        :id_padre => nil, :nombre => 'Difusión y Escucha al Cliente',              :url_path => '#', :icono => 'fa-cog',              :controlador => '', :accion => '', num_hijos: 3, :estatus => 'A')
		OptionMenu.find_or_create_by(    :id_padre => 76, :nombre => 'Difundir Servicios y Eventos',              :url_path => '/difusiones', :icono => 'fa-cog',              :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
		OptionMenu.find_or_create_by(    :id_padre => 76, :nombre => 'Atender opiniones',              :url_path => '/opiniones', :icono => 'fa-cog',              :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')

    OptionMenu.find_or_create_by(        :id_padre => nil, :nombre => 'Administración',              :url_path => '#', :icono => 'fa-cog',              :controlador => '', :accion => '', num_hijos: 4, :estatus => 'A')
        OptionMenu.find_or_create_by(    :id_padre => 79, :nombre => 'General',                   :url_path => '#', :icono => 'fa-users',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
        OptionMenu.find_or_create_by(    :id_padre => 79, :nombre => 'Base de Datos',                   :url_path => '#', :icono => 'fa-users',             :controlador => '', :accion => '', num_hijos: 3, :estatus => 'A')
    	    OptionMenu.find_or_create_by(:id_padre => 81, :nombre => 'Respaldo',               :url_path => '/guardarback', :icono => 'cloud',        :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
            OptionMenu.find_or_create_by(:id_padre => 81, :nombre => 'Recuperacion',               :url_path => '/restauracion', :icono => 'window-restore',        :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
            OptionMenu.find_or_create_by(:id_padre => 81, :nombre => 'Historico',               :url_path => '/historico', :icono => '',        :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
        OptionMenu.find_or_create_by(    :id_padre => 79, :nombre => 'Sitio Web',              :url_path => '#', :icono => 'fa-cog',              :controlador => '', :accion => '', num_hijos: 6, :estatus => 'A')
	  	    OptionMenu.find_or_create_by(:id_padre => 85, :nombre => 'Organización',                       :url_path => '/informacion_generals', :icono => 'fa-at',               :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 85, :nombre => 'Tipos de Noticia',                  :url_path => '/tipo_noticias', :icono => 'newspaper',          :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 85, :nombre => 'Noticias',                  :url_path => '/noticias', :icono => 'newspaper',          :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	  	    OptionMenu.find_or_create_by(:id_padre => 85, :nombre => 'Tipos de Pregunta',                  :url_path => '/tipo_preguntas', :icono => 'newspaper',          :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	  	    OptionMenu.find_or_create_by(:id_padre => 85, :nombre => 'Preguntas',                  :url_path => '/preguntas', :icono => 'newspaper',          :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 85, :nombre => 'Tipos de Opinión',                   :url_path => '/tipo_opiniones', :icono => '',             :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
		OptionMenu.find_or_create_by(    :id_padre => 79, :nombre => 'Seguridad Funcional',                   :url_path => '#', :icono => 'fa-users',             :controlador => '', :accion => '', num_hijos: 2, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 92, :nombre => 'Usuarios',               :url_path => '/usuarios', :icono => 'fa-user-plus',        :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')
	        OptionMenu.find_or_create_by(:id_padre => 92, :nombre => 'Roles',                      :url_path => '/roles', :icono => 'fa-bookmark-o',        :controlador => '', :accion => '', num_hijos: 0, :estatus => 'A')


# DATOS POR DEFECTO - PARA UTILIZAR EN EL EJEMPLO, ETC...

    # Cargar la tabla auxiliar entre opción de menú y rol con todas las opciones para cada rol
    # Rol 1: DUEÑO
    $i = 1
    begin

        if $i > OptionMenu.count
           $i = -1
        else

        	OptionRol.find_or_create_by(:option_menu => OptionMenu.find($i), :rol => Rol.find(1))
        	$i = $i+1
        end
    end while $i != -1

    # Rol 2: ESPECIALISTA
    OptionRol.find_or_create_by(:option_menu => OptionMenu.find(55), :rol => Rol.find(2)) # AGENDA
    OptionRol.find_or_create_by(:option_menu => OptionMenu.find(56), :rol => Rol.find(2)) # Mi Horario
    OptionRol.find_or_create_by(:option_menu => OptionMenu.find(58), :rol => Rol.find(2)) # Eventualidades
    OptionRol.find_or_create_by(:option_menu => OptionMenu.find(62), :rol => Rol.find(2)) # SERVICIOS MÉDICOS
    OptionRol.find_or_create_by(:option_menu => OptionMenu.find(64), :rol => Rol.find(2)) # Atender Cita

    # Rol 3: RECEPCIONISTA
    OptionRol.find_or_create_by(:option_menu => OptionMenu.find(62), :rol => Rol.find(3)) # SERVICIOS MÉDICOS
    OptionRol.find_or_create_by(:option_menu => OptionMenu.find(63), :rol => Rol.find(3)) # Confirmar Cita

    # Rol 4: PACIENTE
    OptionRol.find_or_create_by(:option_menu => OptionMenu.find(59), :rol => Rol.find(4)) # CITAS
    OptionRol.find_or_create_by(:option_menu => OptionMenu.find(60), :rol => Rol.find(4)) # Mis Citas
    OptionRol.find_or_create_by(:option_menu => OptionMenu.find(61), :rol => Rol.find(4)) # Historial
    OptionRol.find_or_create_by(:option_menu => OptionMenu.find(62), :rol => Rol.find(4)) # SERVICIOS MÉDICOS
    OptionRol.find_or_create_by(:option_menu => OptionMenu.find(65), :rol => Rol.find(4)) # Evaluar

    #Rol 5:Seguridad
    OptionRol.find_or_create_by(:option_menu => OptionMenu.find(82), :rol => Rol.find(5))
    OptionRol.find_or_create_by(:option_menu => OptionMenu.find(92), :rol => Rol.find(5)) # Seguridad Funcional
    OptionRol.find_or_create_by(:option_menu => OptionMenu.find(93), :rol => Rol.find(5)) # Usuarios
    OptionRol.find_or_create_by(:option_menu => OptionMenu.find(94), :rol => Rol.find(5)) # Roles


    TipoEvaluacion.find_or_create_by(:descripcion => 'Médico', :estatus => 1)
    TipoEvaluacion.find_or_create_by(:descripcion => 'Paciente', :estatus => 1)

    Evaluacion.find_or_create_by(:descripcion => 'Del (1 al 10, siendo el 1 poco el 10 mucho) indique que le ha parecido la:', :tipo_evaluacion => TipoEvaluacion.find(2))
    Evaluacion.find_or_create_by(:descripcion => 'Seleccione como se sintio con respecto a la:', :tipo_evaluacion => TipoEvaluacion.find(2))


    TipoBusqueda.find_or_create_by(:descripcion => 'Servicios', :estatus => 1)
    TipoBusqueda.find_or_create_by(:descripcion => 'Especialistas', :estatus => 1)

    TipoDifusion.find_or_create_by(:descripcion => "General")
    TipoDifusion.find_or_create_by(:descripcion => "Segmentada")


    MedioDifusion.find_or_create_by(:descripcion => 'Email', :estatus => 1)
    MedioDifusion.find_or_create_by(:descripcion => 'Facebook', :estatus => 1)
    MedioDifusion.find_or_create_by(:descripcion => 'App Móvil', :estatus => 1)

     CriterioTipoServicio.find_or_create_by(:criterio => Criterio.find(1),:tipo_servicio => TipoServicio.find(1), estatus: 1)
     CriterioTipoServicio.find_or_create_by(:criterio => Criterio.find(2),:tipo_servicio => TipoServicio.find(1), estatus: 1)
     CriterioTipoServicio.find_or_create_by(:criterio => Criterio.find(3),:tipo_servicio => TipoServicio.find(1), estatus: 1)
     CriterioTipoServicio.find_or_create_by(:criterio => Criterio.find(1),:tipo_servicio => TipoServicio.find(2), estatus: 1)
     CriterioTipoServicio.find_or_create_by(:criterio => Criterio.find(2),:tipo_servicio => TipoServicio.find(2), estatus: 1)
     CriterioTipoServicio.find_or_create_by(:criterio => Criterio.find(3),:tipo_servicio => TipoServicio.find(2), estatus: 1)
     CriterioTipoServicio.find_or_create_by(:criterio => Criterio.find(1),:tipo_servicio => TipoServicio.find(3), estatus: 1)
     CriterioTipoServicio.find_or_create_by(:criterio => Criterio.find(2),:tipo_servicio => TipoServicio.find(3), estatus: 1)
     CriterioTipoServicio.find_or_create_by(:criterio => Criterio.find(3),:tipo_servicio => TipoServicio.find(3), estatus: 1)
     CriterioTipoServicio.find_or_create_by(:criterio => Criterio.find(1),:tipo_servicio => TipoServicio.find(4), estatus: 1)
     CriterioTipoServicio.find_or_create_by(:criterio => Criterio.find(2),:tipo_servicio => TipoServicio.find(4), estatus: 1)
     CriterioTipoServicio.find_or_create_by(:criterio => Criterio.find(3),:tipo_servicio => TipoServicio.find(4), estatus: 1)
     CriterioTipoServicio.find_or_create_by(:criterio => Criterio.find(1),:tipo_servicio => TipoServicio.find(5), estatus: 1)
     CriterioTipoServicio.find_or_create_by(:criterio => Criterio.find(2),:tipo_servicio => TipoServicio.find(5), estatus: 1)
     CriterioTipoServicio.find_or_create_by(:criterio => Criterio.find(3),:tipo_servicio => TipoServicio.find(5), estatus: 1)
     CriterioTipoServicio.find_or_create_by(:criterio => Criterio.find(1),:tipo_servicio => TipoServicio.find(6), estatus: 1)
     CriterioTipoServicio.find_or_create_by(:criterio => Criterio.find(2),:tipo_servicio => TipoServicio.find(6), estatus: 1)
     CriterioTipoServicio.find_or_create_by(:criterio => Criterio.find(3),:tipo_servicio => TipoServicio.find(6), estatus: 1)
     CriterioTipoServicio.find_or_create_by(:criterio => Criterio.find(1),:tipo_servicio => TipoServicio.find(7), estatus: 1)
     CriterioTipoServicio.find_or_create_by(:criterio => Criterio.find(2),:tipo_servicio => TipoServicio.find(7), estatus: 1)
     CriterioTipoServicio.find_or_create_by(:criterio => Criterio.find(3),:tipo_servicio => TipoServicio.find(7), estatus: 1)

TipoNoticia.find_or_create_by(:descripcion => 'Sobre Servicio', :estatus => 1)
TipoNoticia.find_or_create_by(:descripcion => 'Informativa', :estatus => 1)
TipoNoticia.find_or_create_by(:descripcion => 'Especiales', :estatus => 1)

TipoNotificacion.find_or_create_by(:descripcion => 'Citas', :estatus => 1)
TipoNotificacion.find_or_create_by(:descripcion => 'Servicio', :estatus => 1)
TipoNotificacion.find_or_create_by(:descripcion => 'Evento', :estatus => 1)
TipoNotificacion.find_or_create_by(:descripcion => 'Eventualidad', :estatus => 1)

Noticia.find_or_create_by(:titulo => 'Beneficios del ejercicio físico', :descripcion => 'El ejercicio físico vigoroso aporta mayores beneficios para la salud cardiovascular que la práctica de ejercicio leve o moderado ', :tipo_noticia => TipoNoticia.find(2), :estatus => 1, :contenido => 'Los resultados de la investigación, realizada por especialistas de la Unidad Quirúrgica “La Trinidad“ y de la Universidad Controocidental “Lisandro Alvarado“ con una muestra de más de 10.000 personas, se han publicado en la revista científica American Journal of Preventive Medicine')
Noticia.find_or_create_by(:titulo => 'Congreso Nacional de Periodismo Sanitario', :descripcion => 'La Unidad Quirúrgica “La Trinidad“, sede del próximo Congreso Nacional de Periodismo Sanitario', :tipo_noticia => TipoNoticia.find(2), :estatus => 1, :contenido => 'Del próximo 31 de marzo al 2 de abril, Barquisimeto acogerá el simposio que organiza anualmente la Asociación Nacional de Informadores de la Salud ')
Noticia.find_or_create_by(:titulo => 'Nuevo anticuerpo para tratar el mieloma múltiple', :descripcion => 'Desarrollan un nuevo anticuerpo para tratar el mieloma múltiple con elevada eficacia demostrada en estudios pre-clínicos', :tipo_noticia => TipoNoticia.find(1), :estatus => 1, :contenido => 'Investigadores del Laboratorio “Alemán Giménez“ desarrollan un fármaco altamente especifico que estimula la acción antitumoral de las células T del sistema inmune en pacientes con mieloma múltiple')

TipoPregunta.find_or_create_by(:descripcion => 'Sobre la Organización', :estatus => 1)
TipoPregunta.find_or_create_by(:descripcion => 'Sobre el Sistema Alice', :estatus => 1)
TipoPregunta.find_or_create_by(:descripcion => 'Sobre los Servicios', :estatus => 1)

Pregunta.find_or_create_by(descripcion: '¿Qué significa Alice?',estatus: 1, respuesta: "Real, verdadero y sincero. Asi como las cualidades de los profesionales de la medicina que trabajan con nosotros.", :tipo_pregunta => TipoPregunta.find(2))
Pregunta.find_or_create_by(descripcion: '¿Dónde se encuentra ubicada la Unidad Quirúrgica “La Trinidad“?', respuesta: "Carrera 28 entre calles 9 y 10",estatus: 1, :tipo_pregunta => TipoPregunta.find(1))
Pregunta.find_or_create_by(descripcion: '¿Cuáles son los servicios que ofrece la Unidad Quirúrgica “La Trinidad“?', respuesta: "Consulta de Atención Primaria, Laboratorio e Imagenología",estatus: 1, :tipo_pregunta => TipoPregunta.find(3))
Pregunta.find_or_create_by(descripcion: '¿Qué exámenes ofrece el Laboratorio Alemán Giménez?',estatus: 1, respuesta: "Hematología completa, Glicemia en ayunas, Orina, Urea, entre otros", :tipo_pregunta => TipoPregunta.find(2))
Pregunta.find_or_create_by(descripcion: '¿Qué imágenes ofrece el Centro de Imágenes “La Trinidad“ (CEDILAT)?',estatus: 1, respuesta: "Resonancia magnética, Tomografía Axial Computarizada, Desintometría Ósea, Ecosonograma, Mamografía, Radiología, entre otros. ", :tipo_pregunta => TipoPregunta.find(2))


InformacionGeneral.find_or_create_by(:nombre =>"Unidad Quirúrgica La Trinidad", :rif => "J-30530509-9", :direccion => "Carrera 28 entre calles 9 y 10", :tlf => '0251-2525284',:estatus => 1)

Configuracion.find_or_create_by(envia_email: 1, envia_notificaciones: 1)

PlantillaCorreo.find_or_create_by(descripcion: "Plantilla para creacion de citas.", texto:" ", estatus:1)
PlantillaCorreo.find_or_create_by(descripcion: "Plantilla para cancelacion de citas.", texto:" ", estatus:1)
PlantillaCorreo.find_or_create_by(descripcion: "Plantilla para difusion de servicios.", texto:" ", estatus:1)
PlantillaCorreo.find_or_create_by(descripcion: "Plantilla para difusion de eventos.", texto:" ", estatus:1)
PlantillaCorreo.find_or_create_by(descripcion: "Plantilla para creacion de usuario.", texto:" ", estatus:1)

     puts 'seed'

