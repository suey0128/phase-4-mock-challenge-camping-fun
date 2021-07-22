class CamperSerializer < ActiveModel::Serializer
  attributes :id, :name, :age

  # has_many :signups
  has_many :activities, through: :signups
end
