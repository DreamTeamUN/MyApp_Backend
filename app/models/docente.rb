class Docente < ApplicationRecord
  has_one_and_belongs_to_many :docente
  belongs_to :usuario
end
