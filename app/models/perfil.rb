class Perfil < ApplicationRecord

  has_many :adiccion_perfiles, dependent: :destroy
  has_many :adicciones, :through => :adiccion_perfiles, dependent: :destroy
  has_many :cirugia_perfiles, dependent: :destroy
  has_many :cirugias, through: :cirugia_perfiles, dependent: :destroy
  has_many :discapacidad_perfiles, dependent: :destroy
  has_many :discapacidades, through: :discapacidad_perfiles, dependent: :destroy
  has_many :estado_civil_perfiles, dependent: :destroy
  has_many :estado_civiles, through: :estado_civil_perfiles, dependent: :destroy
  has_many :grupo_sanguineo_perfiles, dependent: :destroy
  has_many :grupo_sanguineos, through: :grupo_sanguineo_perfiles, dependent: :destroy
  has_many :habito_perfiles, dependent: :destroy
  has_many :habitos, through: :habito_perfiles, dependent: :destroy
  has_many :lesion_perfiles, dependent: :destroy
  has_many :lesiones, through: :lesion_perfiles, dependent: :destroy
  has_many :ocupacion_perfiles, dependent: :destroy
  has_many :ocupaciones, through: :ocupacion_perfiles, dependent: :destroy
  has_many :patologia_perfiles, dependent: :destroy
  has_many :patologias, through: :patologia_perfiles, dependent: :destroy
  has_many :profesion_perfiles, dependent: :destroy  
  has_many :profesiones, through: :profesion_perfiles, dependent: :destroy
  has_many :sexo_perfiles, dependent: :destroy
  has_many :sexos, through: :sexo_perfiles, dependent: :destroy
  has_many :perfil_vacunas, dependent: :destroy
  has_many :vacunas, through: :perfil_vacunas, dependent: :destroy
  has_many :rango_edad_perfiles, dependent: :destroy
  has_many :rango_edades, through: :rango_edad_perfiles, dependent: :destroy
  has_many :rango_peso_perfiles, dependent: :destroy
  has_many :rango_pesos, through: :rango_peso_perfiles, dependent: :destroy

  after_save :save_adicciones, :save_cirugias, :save_discapacidades, :save_estado_civiles, :save_grupo_sanguineos,
                :save_habitos, :save_lesiones, :save_ocupaciones, :save_patologias, :save_profesiones, :save_vacunas,
                :save_sexos, :save_rango_edades, :save_rango_pesos

    attr_reader :adiccionesPerfil, :cirugiasPerfil, :discapacidadesPerfil, :estadoCivilesPerfil, :grupoSanguineoPerfil,
                :habitosPerfil, :lesionesPerfil, :ocupacionesPerfil, :patologiasPerfil, :profesionesPerfil, :vacunasPerfil,
                :sexosPerfil, :rangoEdadesPerfil, :rangoPesosPerfil

  def self.titulo
	  return "Perfil"
  end

  def adiccionesPerfil=(value)
	  	@adiccionesPerfil = value
	  end

    def cirugiasPerfil=(value)
      @cirugiasPerfil = value
    end

    def criterioPerfil=(value)
      @criteriosPerfil = value
    end

    def discapacidadesPerfil=(value)
      @discapacidadesPerfil = value
    end

    def estadoCivilesPerfil=(value)
      @estadoCivilesPerfil = value
    end

    def grupoSanguineosPerfil=(value)
      @grupoSanguineosPerfil = value
    end

    def habitosPerfil=(value)
      @habitosPerfil = value
    end

    def lesionesPerfil=(value)
      @lesionesPerfil = value
    end

    def ocupacionesPerfil=(value)
      @ocupacionesPerfil = value
    end

    def patologiasPerfil=(value)
      @patologiasPerfil = value
    end

    def profesionesPerfil=(value)
      @profesionesPerfil = value
    end

    def sexosPerfil=(value)
      @sexosPerfil = value
    end

    def vacunasPerfil=(value)
      @vacunasPerfil = value
    end

    def rangoEdadesPerfil=(value)
      @rangoEdadesPerfil = value
    end

    def rangoPesosPerfil=(value)
      @rangoPesosPerfil = value
    end

   private
   def save_adicciones
    AdiccionPerfil.where(:perfil_id => self.id).destroy_all
    if !@adiccionesPerfil.nil?
	      @adiccionesPerfil.each do |adiccion_id|
		      AdiccionPerfil.create(adiccion_id: adiccion_id, perfil_id: self.id )
        end
	   end
   end

   private
   def save_cirugias
    CirugiaPerfil.where(:perfil_id => self.id).destroy_all
    if !@cirugiasPerfil.nil?
        @cirugiasPerfil.each do |cirugia_id|
          CirugiaPerfil.create(cirugia_id: cirugia_id, perfil_id: self.id )
        end
     end
   end

   private
   def save_criterios
    CriterioPerfil.where(:perfil_id => self.id).destroy_all
    if !@criteriosPerfil.nil?
        @criteriosPerfil.each do |criterio_id|
          CriterioPerfil.create(criterio_id: criterio_id, perfil_id: self.id )
        end
     end
   end

   def save_discapacidades
    DiscapacidadPerfil.where(:perfil_id => self.id).destroy_all
    if !@discapacidadesPerfil.nil?
        @discapacidadesPerfil.each do |discapacidad_id|
          DiscapacidadPerfil.create(discapacidad_id: discapacidad_id, perfil_id: self.id )
        end
     end
   end

   private
   def save_estado_civiles
    EstadoCivilPerfil.where(:perfil_id => self.id).destroy_all
    if !@estadoCivilesPerfil.nil?
        @estadoCivilesPerfil.each do |estado_civil_id|
          EstadoCivilPerfil.create(estado_civil_id: estado_civil_id, perfil_id: self.id )
        end
     end
   end

   private
   def save_grupo_sanguineos
    GrupoSanguineoPerfil.where(:perfil_id => self.id).destroy_all
    if !@grupoSanguineosPerfil.nil?
        @grupoSanguineosPerfil.each do |grupo_sanguineo_id|
          GrupoSanguineoPerfil.create(grupo_sanguineo_id: grupo_sanguineo_id, perfil_id: self.id )
        end
     end
   end

   private
   def save_habitos
    HabitoPerfil.where(:perfil_id => self.id).destroy_all
    if !@habitosPerfil.nil?
        @habitosPerfil.each do |habito_id|
          HabitoPerfil.create(habito_id: habito_id, perfil_id: self.id )
        end
     end
   end

   private
   def save_lesiones
    LesionPerfil.where(:perfil_id => self.id).destroy_all
    if !@lesionesPerfil.nil?
        @lesionesPerfil.each do |lesion_id|
          LesionPerfil.create(lesion_id: lesion_id, perfil_id: self.id )
        end
     end
   end

   private
   def save_ocupaciones
    OcupacionPerfil.where(:perfil_id => self.id).destroy_all
    if !@ocupacionesPerfil.nil?
        @ocupacionesPerfil.each do |ocupacion_id|
          OcupacionPerfil.create(ocupacion_id: ocupacion_id, perfil_id: self.id )
        end
     end
   end

   private
   def save_patologias
    PatologiaPerfil.where(:perfil_id => self.id).destroy_all
    if !@patologiasPerfil.nil?
        @patologiasPerfil.each do |patologia_id|
          PatologiaPerfil.create(patologia_id: patologia_id, perfil_id: self.id )
        end
     end
   end

   private
   def save_profesiones
    ProfesionPerfil.where(:perfil_id => self.id).destroy_all
    if !@profesionesPerfil.nil?
        @profesionesPerfil.each do |profesion_id|
          ProfesionPerfil.create(profesion_id: profesion_id, perfil_id: self.id )
        end
     end
   end

   private
   def save_sexos
    SexoPerfil.where(:perfil_id => self.id).destroy_all
    if !@sexosPerfil.nil?
        @sexosPerfil.each do |sexo_id|
          SexoPerfil.create(sexo_id: sexo_id, perfil_id: self.id )
        end
     end
   end

   private
   def save_vacunas
    PerfilVacuna.where(:perfil_id => self.id).destroy_all
    if !@vacunasPerfil.nil?
        @vacunasPerfil.each do |vacuna_id|
          PerfilVacuna.create(vacuna_id: vacuna_id, perfil_id: self.id )
        end
     end
   end

   def save_rango_edades
    RangoEdadPerfil.where(:perfil_id => self.id).destroy_all
    if !@rangoEdadesPerfil.nil?
        @rangoEdadesPerfil.each do |rango_edad_id|
          RangoEdadPerfil.create(rango_edad_id: rango_edad_id, perfil_id: self.id )
        end
     end
   end

   def save_rango_pesos
    RangoPesoPerfil.where(:perfil_id => self.id).destroy_all
    if !@rangoPesosPerfil.nil?
        @rangoPesosPerfil.each do |rango_peso_id|
          RangoPesoPerfil.create(rango_peso_id: rango_peso_id, perfil_id: self.id )
        end
     end
   end

end
