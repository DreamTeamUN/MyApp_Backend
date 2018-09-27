class Programa < ApplicationRecord
  has_many :docente_programa
  has_many :leccion
end
