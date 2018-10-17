# == Schema Information
#
# Table name: tutors
#
#  id         :integer          not null, primary key
#  usuario_id :integer          not null
#

class TutorSerializer < ActiveModel::Serializer
  attributes :id, :usuario_id

  has_many :estudiante
end
