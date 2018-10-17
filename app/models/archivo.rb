# == Schema Information
#
# Table name: archivos
#
#  id           :integer          not null, primary key
#  nombre       :string           not null
#  tipo_archivo :string           default("archivo"), not null
#  extension    :string           not null
#  ruta         :string           not null
#

class Archivo < ApplicationRecord

  #Relaciones
  has_one :archivo_juego
  has_one :juego, through: :archivo_juego
  has_one :entradas
  has_many :usuario

  #Validaciones
  validates :nombre, length: { maximum: 45, minimum: 3 }
  validates :tipo_archivo, inclusion: { in: ["imagen", "audio", "archivo"] }
  validates :extension, inclusion: { in: ["png", "jpg", "jpeg", "pdf", "html", "mp3"] }
  #validates :ruta, format: { with: \A(ruta a recursos)\/\z} #TODO: definir una ruta a recursos

end
