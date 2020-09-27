class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.date :date
      t.string :event
      t.text :totaldistance
      t.time :totaltime
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
