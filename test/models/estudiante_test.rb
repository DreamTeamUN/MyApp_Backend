# == Schema Information
#
# Table name: estudiantes
#
#  id               :integer          not null, primary key
#  tutor_id         :integer          not null
#  nombre           :string
#  fecha_nacimiento :date
#  archivo_id       :integer          default(0)
#  created_at       :datetime
#  updated_at       :datetime
#

require 'test_helper'

class EstudianteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
