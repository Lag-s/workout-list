class WorkoutsController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def show
  end
  
  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.user_id = current_user.id
    
    if @workout.save
      flash[:success] = "ワークアウトを投稿しました"
      redirect_to current_user
    else
      flash.now[:danger] = "ワークアウトの投稿に失敗しました"
      render :new
    end
  end

  def edit
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
  
  private

  def set_message
    @workout = Workout.find(params[:id])
  end
  
  def workout_params
    params.require(:workout).permit(:date, :event, :totaldistance, :totaltime, :content)
  end
end
