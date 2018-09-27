class Aula < ApplicationRecord
  has_many :estudiante_aula
  belongs_to :docente_programa #Por ahora
end
