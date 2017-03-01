class TipoServicio < ApplicationRecord
	belongs_to :tipo_atencion
  belongs_to :categoria
  belongs_to :especialidad
  has_many :servicios

	has_many :adiccion_tipo_servicios
  has_many :adicciones, :through => :adiccion_tipo_servicios
  has_many :cirugia_tipo_servicios
  has_many :cirugias, through: :cirugia_tipo_servicios
  has_many :profesion_tipo_servicios
  has_many :profesiones, through: :profesion_tipo_servicios
  has_many :patologia_tipo_servicios
  has_many :patologias, through: :patologia_tipo_servicios

  has_many :criterio_tipo_servicios
  has_many :criterio, through: :criterio_tipo_servicios
  has_many :discapacidad_tipo_servicios
  has_many :discapacidades, through: :discapacidad_tipo_servicios
  has_many :estado_civil_tipo_servicios
  has_many :estado_civiles, through: :estado_civil_tipo_servicios
  has_many :grupo_sanguineo_tipo_servicios
  has_many :grupo_sanguineos, through: :grupo_sanguineo_tipo_servicios
  has_many :habito_tipo_servicios
  has_many :habitos, through: :habito_tipo_servicios
  has_many :lesion_tipo_servicios
  has_many :lesiones, through: :lesion_tipo_servicios
  has_many :ocupacion_tipo_servicios
  has_many :ocupaciones, through: :ocupacion_tipo_servicios
  has_many :patologia_tipo_servicios
  has_many :patologias, through: :patologia_tipo_servicios
  has_many :profesion_tipo_servicios
  has_many :profesiones, through: :profesion_tipo_servicios
  has_many :sexo_tipo_servicios
  has_many :sexos, through: :sexo_tipo_servicios
  has_many :tipo_servicio_vacunas
  has_many :vacunas, through: :tipo_servicio_vacunas
  has_many :rango_edad_tipo_servicios
  has_many :rango_edades, through: :rango_edad_tipo_servicios
  has_many :rango_peso_tipo_servicios
  has_many :rango_pesos, through: :rango_peso_tipo_servicios

	has_attached_file :foto, styles: { medium: "300x300>", thumb: "100x100>" }
  	validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/

  	after_save :save_adicciones, :save_cirugias, :save_discapacidades, :save_estado_civiles, :save_grupo_sanguineos,
                :save_habitos, :save_lesiones, :save_ocupaciones, :save_patologias, :save_profesiones, :save_vacunas,
                :save_criterios, :save_sexos, :save_rango_edades, :save_rango_pesos

    attr_reader :adiccionesTipoServicio, :cirugiasTipoServicio, :discapacidadesTipoServicio, :estadoCivilesTipoServicio, :grupoSanguineoTipoServicio,
                :habitosTipoServicio, :lesionesTipoServicio, :ocupacionesTipoServicio, :patologiasTipoServicio, :profesionesTipoServicio, :vacunasTipoServicio,
                :criteriosTipoServicio, :sexosTipoServicio, :rangoEdadesTipoServicio, :rangoPesosTipoServicio


  	def adiccionesTipoServicio=(value)
	  	@adiccionesTipoServicio = value
	  end

    def cirugiasTipoServicio=(value)
      @cirugiasTipoServicio = value
    end

    def criterioTipoServicio=(value)
      @criteriosTipoServicio = value
    end
  
    def discapacidadesTipoServicio=(value)
      @discapacidadesTipoServicio = value
    end

    def estadoCivilesTipoServicio=(value)
      @estadoCivilesTipoServicio = value
    end

    def grupoSanguineosTipoServicio=(value)
      @grupoSanguineosTipoServicio = value
    end
    
    def habitosTipoServicio=(value)
      @habitosTipoServicio = value
    end

    def lesionesTipoServicio=(value)
      @lesionesTipoServicio = value
    end

    def ocupacionesTipoServicio=(value)
      @ocupacionesTipoServicio = value
    end

    def patologiasTipoServicio=(value)
      @patologiasTipoServicio = value
    end

    def profesionesTipoServicio=(value)
      @profesionesTipoServicio = value
    end

    def sexosTipoServicio=(value)
      @sexosTipoServicio = value
    end 

    def vacunasTipoServicio=(value)
      @vacunasTipoServicio = value
    end 

    def rangoEdadesTipoServicio=(value)
      @rangoEdadesTipoServicio = value
    end

    def rangoPesosTipoServicio=(value)
      @rangoPesosTipoServicio = value
    end  

   private
   def save_adicciones
    AdiccionTipoServicio.where(:tipo_servicio_id => self.id).destroy_all
    if !@adiccionesTipoServicio.nil?  
	      @adiccionesTipoServicio.each do |adiccion_id|
		      AdiccionTipoServicio.create(adiccion_id: adiccion_id, tipo_servicio_id: self.id )
        end
	   end
   end

   private
   def save_cirugias
    CirugiaTipoServicio.where(:tipo_servicio_id => self.id).destroy_all
    if !@cirugiasTipoServicio.nil?
        @cirugiasTipoServicio.each do |cirugia_id|
          CirugiaTipoServicio.create(cirugia_id: cirugia_id, tipo_servicio_id: self.id )
        end
     end
   end

   private

   def save_criterios
    CriterioTipoServicio.where(:tipo_servicio_id => self.id).destroy_all
    if !@criteriosTipoServicio.nil?
        @criteriosTipoServicio.each do |criterio_id|
          CriterioTipoServicio.create(criterio_id: criterio_id, tipo_servicio_id: self.id )
        end
     end
   end

   def save_discapacidades
    DiscapacidadTipoServicio.where(:tipo_servicio_id => self.id).destroy_all
    if !@discapacidadesTipoServicio.nil?
        @discapacidadesTipoServicio.each do |discapacidad_id|
          DiscapacidadTipoServicio.create(discapacidad_id: discapacidad_id, tipo_servicio_id: self.id )
        end
     end
   end

   private
   def save_estado_civiles
    EstadoCivilTipoServicio.where(:tipo_servicio_id => self.id).destroy_all
    if !@estadoCivilesTipoServicio.nil?
        @estadoCivilesTipoServicio.each do |estado_civil_id|
          EstadoCivilTipoServicio.create(estado_civil_id: estado_civil_id, tipo_servicio_id: self.id )
        end
     end
   end

   private
   def save_grupo_sanguineos
    GrupoSanguineoTipoServicio.where(:tipo_servicio_id => self.id).destroy_all
    if !@grupoSanguineosTipoServicio.nil?
        @grupoSanguineosTipoServicio.each do |grupo_sanguineo_id|
          GrupoSanguineoTipoServicio.create(grupo_sanguineo_id: grupo_sanguineo_id, tipo_servicio_id: self.id )
        end
     end
   end

   private
   def save_habitos
    HabitoTipoServicio.where(:tipo_servicio_id => self.id).destroy_all
    if !@habitosTipoServicio.nil?
        @habitosTipoServicio.each do |habito_id|
          HabitoTipoServicio.create(habito_id: habito_id, tipo_servicio_id: self.id )
        end
     end
   end

   private
   def save_lesiones
    LesionTipoServicio.where(:tipo_servicio_id => self.id).destroy_all
    if !@lesionesTipoServicio.nil?
        @lesionesTipoServicio.each do |lesion_id|
          LesionTipoServicio.create(lesion_id: lesion_id, tipo_servicio_id: self.id )
        end
     end
   end

   private
   def save_ocupaciones
    OcupacionTipoServicio.where(:tipo_servicio_id => self.id).destroy_all
    if !@ocupacionesTipoServicio.nil?
        @ocupacionesTipoServicio.each do |ocupacion_id|
          OcupacionTipoServicio.create(ocupacion_id: ocupacion_id, tipo_servicio_id: self.id )
        end
     end
   end

   private
   def save_patologias
    PatologiaTipoServicio.where(:tipo_servicio_id => self.id).destroy_all
    if !@patologiasTipoServicio.nil?
        @patologiasTipoServicio.each do |patologia_id|
          PatologiaTipoServicio.create(patologia_id: patologia_id, tipo_servicio_id: self.id )
        end
     end
   end

   private
   def save_profesiones
    ProfesionTipoServicio.where(:tipo_servicio_id => self.id).destroy_all
    if !@profesionesTipoServicio.nil?
        @profesionesTipoServicio.each do |profesion_id|
          ProfesionTipoServicio.create(profesion_id: profesion_id, tipo_servicio_id: self.id )
        end
     end
   end

   private
   def save_sexos
    SexoTipoServicio.where(:tipo_servicio_id => self.id).destroy_all
    if !@sexoTipoServicio.nil?
        @sexoTipoServicio.each do |sexo_id|
          SexoTipoServicio.create(sexo_id: sexo_id, tipo_servicio_id: self.id )
        end
     end
   end

   private
   def save_vacunas
    TipoServicioVacuna.where(:tipo_servicio_id => self.id).destroy_all
    if !@vacunasTipoServicio.nil?
        @vacunasTipoServicio.each do |vacuna_id|
          TipoServicioVacuna.create(vacuna_id: vacuna_id, tipo_servicio_id: self.id )
        end
     end
   end

   def save_rango_edades
    RangoEdadTipoServicio.where(:tipo_servicio_id => self.id).destroy_all
    if !@rangoEdadesTipoServicio.nil?
        @rangoEdadesTipoServicio.each do |rango_edad_id|
          RangoEdadTipoServicio.create(rango_edad_id: rango_edad_id, tipo_servicio_id: self.id )
        end
     end
   end

   def save_rango_pesos
    RangoPesoTipoServicio.where(:tipo_servicio_id => self.id).destroy_all
    if !@rangoPesosTipoServicio.nil?
        @rangoPesosTipoServicio.each do |rango_peso_id|
          RangoPesoTipoServicio.create(rango_peso_id: rango_peso_id, tipo_servicio_id: self.id )
        end
     end
   end

  def self.titulo
    return "Tipos de Servicio"
  end

end
