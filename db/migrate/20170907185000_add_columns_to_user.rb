class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nick, :string
    add_column :users, :name, :string
    add_column :users, :phone, :integer
    add_column :users, :photo, :binary
  end
end
