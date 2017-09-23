class CreateTypeBycicles < ActiveRecord::Migration[5.1]
  def change
    create_table :type_bycicles do |t|
      t.string :description, null: false
      t.timestamps
    end
  end
end
