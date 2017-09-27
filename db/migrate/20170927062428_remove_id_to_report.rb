class RemoveIdToReport < ActiveRecord::Migration[5.1]
  def change
    remove_column :reports, :site_id
  end
end
