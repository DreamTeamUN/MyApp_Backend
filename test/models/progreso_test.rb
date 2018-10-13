# == Schema Information
#
# Table name: progresos
#
#  id                    :integer          not null, primary key
#  repeticion_completada :integer          default(0), not null
#  estudiante_id         :integer          not null
#  leccion_id            :integer          not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'test_helper'

class ProgresoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
