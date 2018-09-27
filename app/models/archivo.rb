class Archivo < ApplicationRecord
  has_one :archivo_juego
  has_one :entradas
  has_many :usuario
end
