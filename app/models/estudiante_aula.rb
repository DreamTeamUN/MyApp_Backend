class EstudianteAula < ApplicationRecord
  belongs_to :aula
  belongs_to :estudiante
end
