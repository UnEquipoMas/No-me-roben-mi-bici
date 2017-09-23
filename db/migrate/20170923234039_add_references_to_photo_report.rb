class AddReferencesToPhotoReport < ActiveRecord::Migration[5.1]
  def change
    add_reference :photo_reports, :report, foreign_key:true
  end
end
