class ToppagesController < ApplicationController
  def index
    if logged_in?
      @workout = current_user.workouts.build
      @workouts = current_user.feed_workouts.order(id: :desc).page(params[:page])
    end
  end
end
