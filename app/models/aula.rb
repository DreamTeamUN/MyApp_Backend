class Aula < ApplicationRecord
  has_and_belongs_to_many :estudiante
  belongs_to :docente_programa #Por ahora
end
