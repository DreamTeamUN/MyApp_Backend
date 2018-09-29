class Usuario < ApplicationRecord

  #Relaciones
  has_one :tutor
  has_one :docente
  has_one :estudiante
  has_many :entrada
  belongs_to :archivo
  belongs_to :tipo_usuario
  has_many :registro_actividad
  has_many :tipo_actividad , through: :registro_actividad

  #Validaciones
  validates :user, length: { minimum: 3, maximum: 45 }
  validates :password, length: { is: 255 }
  validates :nombre, length: { minimum: 3, maximum: 45 }
  validates :correo, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Correo invalido" }

end
