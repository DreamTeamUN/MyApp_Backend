class Usuario < ApplicationRecord
  has_one :tutor
  has_one :docente
  has_one :estudiante
  has_many :entrada
  belongs_to :archivo
end
