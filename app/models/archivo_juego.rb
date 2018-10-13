# == Schema Information
#
# Table name: archivo_juegos
#
#  id            :integer          not null, primary key
#  tipo_juego_id :integer          not null
#  archivo_id    :integer          not null
#  frase_id      :integer
#

class ArchivoJuego < ApplicationRecord

  #Relaciones
  belongs_to :tipo_juego
  belongs_to :archivo
  belongs_to :frase

  #Validaciones

end
