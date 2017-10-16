class Photo < ActiveRecord::Base
  # just add an attachable_id integer column and an attachable_type string column
  belongs_to :attachable, :polymorphic => true
  has_attached_file :data, :your_paperclip_options
end