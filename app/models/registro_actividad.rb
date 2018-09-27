class RegistroActividad < ApplicationRecord
  belongs_to :usuario
  belongs_to :tipo_actividad
end
