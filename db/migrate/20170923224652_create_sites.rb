class CreateSites < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.string :name, null:false
      t.string :lat, null:false
      t.string :lng, null:false
      t.timestamps
    end
  end
end
