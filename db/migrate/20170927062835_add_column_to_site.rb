class AddColumnToSite < ActiveRecord::Migration[5.1]
  def change
    add_column :sites, :report_id, :integer, foreign_key:true
  end
end
