class CreateCommentStoles < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_stoles do |t|
      t.string :comment

      t.timestamps
    end
  end
end
