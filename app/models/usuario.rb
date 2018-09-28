class Usuario < ApplicationRecord
  has_one :tutor
  has_one :docente
  has_one :estudiante
  has_many :entrada
  belongs_to :archivo
  belongs_to :tipo_usuario
  has_many :registro_actividad
  has_many :tipo_actividad , through: :registro_actividad
end
