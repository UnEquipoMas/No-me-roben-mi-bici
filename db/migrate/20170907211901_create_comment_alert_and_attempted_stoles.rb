class CreateCommentAlertAndAttemptedStoles < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_alert_and_attempted_stoles do |t|
      t.string :comment

      t.timestamps
    end
  end
end
