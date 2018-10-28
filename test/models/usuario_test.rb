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

require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
