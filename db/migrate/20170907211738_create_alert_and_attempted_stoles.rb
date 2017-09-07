class CreateAlertAndAttemptedStoles < ActiveRecord::Migration[5.1]
  def change
    create_table :alert_and_attempted_stoles do |t|
      t.date :date
      t.time :hour
      t.text :description
      t.string :site
      t.string :coordinate

      t.timestamps
    end
  end
end
