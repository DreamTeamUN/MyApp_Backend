class Programa < ApplicationRecord
  has_and_belongs_to_many :programa
  has_many :leccion
end
