class FavoritesController < ApplicationController
  def create
    workout = Workout.find(params[:workout_id])
    current_user.favorite(workout)
    flash[:success] = "お気に入りに登録しました。"
    redirect_to root_url
  end

  def destroy
    workout = Workout.find(params[:workout_id])
    current_user.unfavorite(workout)
    flash[:success] = "お気に入りを解除しました。"
    redirect_back(fallback_location: root_path)
  end
end
