# == Schema Information
#
# Table name: usuarios
#
#  id               :integer          not null, primary key
#  user             :string           not null
#  password_digest  :string           not null
#  nombre           :string           not null
#  email            :string           not null
#  fecha_nacimiento :date
#  tipo_usuario_id  :integer          not null
#  archivo_id       :integer          default(0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  last_login       :date
#

class Usuario < ApplicationRecord
  #hashear la contraseña
  has_secure_password

  #Relaciones
  has_one :tutor,   dependent: :destroy
  has_one :docente, dependent: :destroy
  has_many :entrada
  belongs_to :archivo
  belongs_to :tipo_usuario
  has_many :registro_actividad
  has_many :tipo_actividad , through: :registro_actividad

  #Validaciones
  validates :user, length: { minimum: 3, maximum: 45 }, uniqueness: {scope: :user, message: "El nombre de usuario ya existe"}
  validates :nombre, length: { minimum: 3, maximum: 45 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Correo invalido" },
    uniqueness: {scope: :email, message: "El correo ya esta registrado"}
  validates :last_login, presence: true

end
