class CreateBycicles < ActiveRecord::Migration[5.1]
  def change
    create_table :bycicles do |t|
      t.string :serial, null: false
      t.boolean :state, null: false
      t.string :color, null: false
      t.string :description, null: false
      t.timestamps
    end
  end
end
