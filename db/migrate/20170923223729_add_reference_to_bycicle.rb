class AddReferenceToBycicle < ActiveRecord::Migration[5.1]
  def change
    add_reference :bycicles, :type_bycicle, foreign_key: true
    add_reference :bycicles, :brand, foreign_key: true
    add_reference :bycicles, :user, foreign_key: true
  end
end
