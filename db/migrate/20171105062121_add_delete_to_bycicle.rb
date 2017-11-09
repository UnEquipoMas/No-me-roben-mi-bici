class AddDeleteToBycicle < ActiveRecord::Migration[5.1]
  def change
    add_column :bycicles, :del, :boolean, default: false
  end
end
