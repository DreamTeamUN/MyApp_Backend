# == Schema Information
#
# Table name: aulas
#
#  id          :integer          not null, primary key
#  docente_id  :integer
#  programa_id :integer
#  nombre      :string
#  descripcion :string           default("")
#

require 'test_helper'

class AulaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
