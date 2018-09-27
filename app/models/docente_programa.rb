class DocentePrograma < ApplicationRecord
  belongs_to :programa
  belongs_to :docente
  has_many :aula
end
