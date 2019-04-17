class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :artist_id, :image_url, :name

  def image_url
    object.artist.image_url
  end

  def name
    object.artist.name
  end
end
