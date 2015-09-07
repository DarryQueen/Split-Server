class CreateConsumptions < ActiveRecord::Migration
  def change
    create_table :consumptions do |t|
      t.references :membership

      t.timestamps
    end
  end
end
