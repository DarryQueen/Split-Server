class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.float :tip
      t.float :tax
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
