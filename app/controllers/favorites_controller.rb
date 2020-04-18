class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    microposts = Micropost.find(params[:microposts_id])
    current_user.favorite(microposts)
    flash[:success] = 'お気に入りに登録しました'
    redirect_to root_url
  end

  def destroy
    microposts = Micropost.find(params[:microposts_id])
    current_user.unfavorite(microposts)
    flash[:success] = 'お気に入りの登録を解除しました。'
    redirect_to root_url
  end
end
