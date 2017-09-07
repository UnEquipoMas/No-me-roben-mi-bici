class CreateStoles < ActiveRecord::Migration[5.1]
  def change
    create_table :stoles do |t|
      t.string :mode
      t.date :date
      t.time :hour
      t.text :description
      t.string :site
      t.string :coordinates
      t.string :brand_bike
      t.string :type_bicycle

      t.timestamps
    end
  end
end
