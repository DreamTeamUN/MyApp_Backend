class Entrada < ApplicationRecord
  belongs_to :entrada
  belongs_to :archivo
  belongs_to :nivel_acceso
end
