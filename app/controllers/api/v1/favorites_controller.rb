class Api::V1::FavoritesController < ApplicationController
  def destroy
      @favorite= Favorite.find(params[:id])
      @favorite.delete
      if @favorite.destroy
             head :no_content, status: :ok
           else
             render json: @favorite.errors, status: :unprocessable_entity
           end

  end


  private

  def favorite_params
    params.permit(:user_id, :artist_id)
  end
end
