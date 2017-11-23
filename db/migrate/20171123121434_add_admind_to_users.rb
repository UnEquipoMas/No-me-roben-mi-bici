class AddAdmindToUsers < ActiveRecord::Migration[5.1]
def change
    unless column_exists? :users, :admin, :boolean
      add_column :users, :admin, :boolean, default: false
    end
  end
end
