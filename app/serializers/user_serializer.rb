class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar, :bio, :artists
  has_many :favorites

end
