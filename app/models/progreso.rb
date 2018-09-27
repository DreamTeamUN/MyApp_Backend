class Progreso < ApplicationRecord
  belongs_to :leccion
  belongs_to :estudiante
end
