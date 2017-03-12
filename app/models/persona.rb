class Persona < ApplicationRecord
  belongs_to :sexo
  belongs_to :estado_civil
  belongs_to :grupo_sanguineo
  has_one :usuario
  has_one :especialista

  has_many :adiccion_personas
  has_many :adicciones, :through => :adiccion_personas
  has_many :cirugia_personas
  has_many :cirugias, through: :cirugia_personas
  has_many :profesion_personas
  has_many :profesiones, through: :profesion_personas
  has_many :patologia_personas
  has_many :patologias, through: :patologia_personas
  has_many :discapacidad_personas
  has_many :discapacidades, through: :discapacidad_personas
  has_many :habito_personas
  has_many :habitos, through: :habito_personas
  has_many :lesion_personas
  has_many :lesiones, through: :lesion_personas
  has_many :ocupacion_personas
  has_many :ocupaciones, through: :ocupacion_personas
  has_many :patologia_personas
  has_many :patologias, through: :patologia_personas
  has_many :persona_profesiones
  has_many :profesiones, through: :persona_profesiones
  has_many :persona_vacunas
  has_many :vacunas, through: :persona_vacunas

  after_save :save_adicciones, :save_cirugias, :save_discapacidades, :save_habitos, :save_lesiones, :save_ocupaciones, :save_patologias, :save_profesiones, :save_vacunas

  attr_reader :adiccionesPersona, :cirugiasPersona, :discapacidadesPersona,:habitosPersona, :lesionesPersona, :ocupacionesPersona, :patologiasPersona, :profesionesPersona, :vacunasPersona,

  def self.titulo
	  return "Personas"
  end


def self.search(search)
  where("cedula ILIKE ?", "%#{search}%") 
  where("nombre ILIKE ?", "%#{search}%")
  where("apellido ILIKE ?", "%#{search}%")
end


  def nombre_identificacion
    "[#{self.cedula}] #{self.nombre} #{self.apellido}"
  end

  def adiccionesPersona=(value)
	  	@adiccionesPersona = value
	  end

    def cirugiasPersona=(value)
      @cirugiasPersona = value
    end

    def criterioPersona=(value)
      @criteriosPersona = value
    end
  
    def discapacidadesPersona=(value)
      @discapacidadesPersona = value
    end
    
    def habitosPersona=(value)
      @habitosPersona = value
    end

    def lesionesPersona=(value)
      @lesionesPersona = value
    end

    def ocupacionesPersona=(value)
      @ocupacionesPersona = value
    end

    def patologiasPersona=(value)
      @patologiasPersona = value
    end

    def profesionesPersona=(value)
      @profesionesPersona = value
    end

    def vacunasPersona=(value)
      @vacunasPersona = value
    end 

   private
   def save_adicciones
    AdiccionPersona.where(:persona_id => self.id).destroy_all
    if !@adiccionesPersona.nil?  
	      @adiccionesPersona.each do |adiccion_id|
		      AdiccionPersona.create(adiccion_id: adiccion_id, persona_id: self.id )
        end
	   end
   end

   private
   def save_cirugias
    CirugiaPersona.where(:persona_id => self.id).destroy_all
    if !@cirugiasPersona.nil?
        @cirugiasPersona.each do |cirugia_id|
          CirugiaPersona.create(cirugia_id: cirugia_id, persona_id: self.id )
        end
     end
   end

   private
   def save_discapacidades
    DiscapacidadPersona.where(:persona_id => self.id).destroy_all
    if !@discapacidadesPersona.nil?
        @discapacidadesPersona.each do |discapacidad_id|
          DiscapacidadPersona.create(discapacidad_id: discapacidad_id, persona_id: self.id )
        end
     end
   end

   private
   def save_habitos
    HabitoPersona.where(:persona_id => self.id).destroy_all
    if !@habitosPersona.nil?
        @habitosPersona.each do |habito_id|
          HabitoPersona.create(habito_id: habito_id, persona_id: self.id )
        end
     end
   end

   private
   def save_lesiones
    LesionPersona.where(:persona_id => self.id).destroy_all
    if !@lesionesPersona.nil?
        @lesionesPersona.each do |lesion_id|
          LesionPersona.create(lesion_id: lesion_id, persona_id: self.id )
        end
     end
   end

   private
   def save_ocupaciones
    OcupacionPersona.where(:persona_id => self.id).destroy_all
    if !@ocupacionesPersona.nil?
        @ocupacionesPersona.each do |ocupacion_id|
          OcupacionPersona.create(ocupacion_id: ocupacion_id, persona_id: self.id )
        end
     end
   end

   private
   def save_patologias
    PatologiaPersona.where(:persona_id => self.id).destroy_all
    if !@patologiasPersona.nil?
        @patologiasPersona.each do |patologia_id|
          PatologiaPersona.create(patologia_id: patologia_id, persona_id: self.id )
        end
     end
   end

   private
   def save_profesiones
    PersonaProfesion.where(:persona_id => self.id).destroy_all
    if !@profesionesPersona.nil?
        @profesionesPersona.each do |profesion_id|
          PersonaProfesion.create(profesion_id: profesion_id, persona_id: self.id )
        end
     end
   end

   private
   def save_vacunas
    PersonaVacuna.where(:persona_id => self.id).destroy_all
    if !@vacunasPersona.nil?
        @vacunasPersona.each do |vacuna_id|
          PersonaVacuna.create(vacuna_id: vacuna_id, persona_id: self.id )
        end
     end
   end
   
end
