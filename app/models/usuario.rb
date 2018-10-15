# == Schema Information
#
# Table name: usuarios
#
#  id               :integer          not null, primary key
#  user             :string           not null
#  password         :string           not null
#  nombre           :string           not null
#  correo           :string           not null
#  fecha_nacimiento :date
#  tipo_usuario_id  :integer          not null
#  archivo_id       :integer          default(-1)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Usuario < ApplicationRecord
  #hashear la contraseña
  has_secure_password

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
  validates :nombre, length: { minimum: 3, maximum: 45 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Correo invalido" }

end
