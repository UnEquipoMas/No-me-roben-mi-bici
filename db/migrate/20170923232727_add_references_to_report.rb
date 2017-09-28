class AddReferencesToReport < ActiveRecord::Migration[5.1]
  def change
    add_reference :reports, :type_report, foreign_key:true
    add_reference :reports, :site, foreign_key:true
    add_reference :reports, :user, foreign_key:true
    add_reference :reports, :mode, foreign_key:true
    add_reference :reports, :bycicle, foreign_key:true
  end
end
