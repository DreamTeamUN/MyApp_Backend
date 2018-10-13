class UsuarioSerializer < ActiveModel::Serializer
  attributes :id, :user, :nombre, :email, :fecha_nacimiento, :tipo_usuario_id, :archivo_id

  has_one :tutor
  has_one :docente
  has_one :estudiante
  has_many :entrada
  has_many :registro_actividad
  has_many :tipo_actividad , through: :registro_actividad
end
