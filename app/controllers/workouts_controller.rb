class WorkoutsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :set_message, only: [:show]

  def show
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.user_id = current_user.id

    @workout = current_user.workouts.build(workout_params)
    if @workout.save
      flash[:success] = "ワークアウトを投稿しました"
      redirect_to current_user
    else
      @workouts = current_user.feed_workouts.order(id: :desc).page(params[:page])
      flash.now[:danger] = "ワークアウトの投稿に失敗しました"
      render :new
    end
  end

  def edit
    if current_user == @workout.user
      render "edit"
    else
      redirect_to root_url
    end
  end

  def update

    if @workout.update(workout_params)
      flash[:success] = "ワークアウトは正常に更新されました"
      redirect_to @workout
    else
      flash.now[:danger] = "ワークアウトは更新されませんでした"
      render :edit
    end
  end

  def destroy
    @workout.destroy
    flash[:success] = "ワークアウトは正常に削除されました"
    redirect_to current_user
  end

  def calendars
    @workouts = current_user.workouts
  end

  private

  def set_message
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:date, :event, :totaldistance, :totaltime, :content)
  end

  def correct_user
    @workout = current_user.workouts.find_by(id: params[:id])
    unless @workout
      redirect_to root_url
    end
  end
end
