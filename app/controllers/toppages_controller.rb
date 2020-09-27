class ToppagesController < ApplicationController
  def index
    if logged_in?
      @workouts = current_user.workouts.order(id: :desc).page(params[:page])
    end
  end
end
