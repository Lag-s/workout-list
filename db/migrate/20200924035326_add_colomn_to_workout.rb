class AddColomnToWorkout < ActiveRecord::Migration[5.2]
  def change
    add_column :workouts, :content, :text
  end
end
