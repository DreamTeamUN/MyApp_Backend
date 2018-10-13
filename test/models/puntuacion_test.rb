# == Schema Information
#
# Table name: puntuacions
#
#  id                  :integer          not null, primary key
#  puntuacion_obtenida :integer          default(0), not null
#  tipo_juego_id       :integer          not null
#  estudiante_id       :integer          not null
#  leccion_id          :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class PuntuacionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
