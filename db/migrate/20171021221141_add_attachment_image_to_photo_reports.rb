class AddAttachmentImageToPhotoReports < ActiveRecord::Migration[5.1]
  def self.up
    change_table :photo_reports do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :photo_reports, :image
  end
end
