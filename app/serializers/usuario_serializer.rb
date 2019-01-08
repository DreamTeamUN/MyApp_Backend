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

class UsuarioSerializer < ActiveModel::Serializer
  attributes :id, :user, :nombre, :email, :last_login, :tipo_usuario, :archivo

  has_one :tutor
  has_one :docente
  has_many :entrada
  has_many :registro_actividad
  has_many :tipo_actividad , through: :registro_actividad
end
