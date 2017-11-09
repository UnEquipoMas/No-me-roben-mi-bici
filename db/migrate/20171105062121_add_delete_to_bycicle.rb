class AddDeleteToBycicle < ActiveRecord::Migration[5.1]
  def change
    unless column_exists? :bycicles, :del, :boolean
      add_column :bycicles, :del, :boolean, default: false
    end
  end
end
