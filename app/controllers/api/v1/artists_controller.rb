class Api::V1::ArtistsController < ApplicationController
def create
  @artist = Artist.find_or_create_by(name: artist_params[:name])
  @artist.update(image_url: artist_params[:image_url])
  @favorite= Favorite.create(user_id: current_user.id, artist_id: @artist.id)
  render json: {artist: @artist, favorite: @favorite}
end

def update
  @artist = Artist.find_by(params[:id])
  @artist.update(user_params)
end

private
def artist_params
  params.require(:artist).permit(:name, :image_url)
end
end
