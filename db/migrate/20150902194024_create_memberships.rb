class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :user
      t.references :meal
      t.string :role

      t.timestamps
    end
  end
end
