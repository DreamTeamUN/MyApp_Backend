class Docente < ApplicationRecord
  has_many :docente_programa
  belongs_to :usuario
end
