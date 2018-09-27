class TipoUsuario < ApplicationRecord
  has_many :usuario
  has_many :frase_pnl
end
