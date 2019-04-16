class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar, :bio, :favorite
  has_many :artists
end
