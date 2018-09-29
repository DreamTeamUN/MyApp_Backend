class RegistroActividad < ApplicationRecord

  #Relaciones
  belongs_to :usuario
  belongs_to :tipo_actividad

  #Validaciones

end
