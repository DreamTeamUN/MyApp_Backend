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

  validates :frase_id, presence: true

  #Consultas
  def self.by_frase( frase_id, page )
    where("frase_id == ?", frase_id).paginate(page: page, per_page: 10)
  end

  def self.by_tipo_juego( tipo_juego_id, page )
    where("tipo_juego_id == ?", tipo_juego_id).paginate(page: page, per_page: 10)
  end

  def self.repetido( tipo_juego_id, archivo_id, frase_id)
    where("tipo_juego_id == ? AND archivo_id == ? AND frase_id == ?", tipo_juego_id, archivo_id, frase_id)
  end

end
