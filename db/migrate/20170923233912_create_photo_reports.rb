class CreatePhotoReports < ActiveRecord::Migration[5.1]
  def change
    create_table :photo_reports do |t|
      t.string :photo_address

      t.timestamps
    end
  end
end
