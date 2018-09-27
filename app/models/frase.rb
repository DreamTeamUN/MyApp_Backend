class Frase < ApplicationRecord
  belongs_to :leccion
  has_many :archivo_juego
end
