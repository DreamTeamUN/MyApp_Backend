# == Schema Information
#
# Table name: archivos
#
#  id           :integer          not null, primary key
#  nombre       :string           not null
#  tipo_archivo :string           default("archivo"), not null
#  extension    :string           not null
#  ruta         :string           not null
#

require 'test_helper'

class ArchivoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
