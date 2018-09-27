class Tutor < ApplicationRecord
  belongs_to :usuario
  has_many :estudiante
end
