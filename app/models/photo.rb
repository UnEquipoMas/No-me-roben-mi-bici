# == Schema Information
#
# Table name: photos
#
#  id                 :integer          not null, primary key
#  attachable_type    :string
#  attachable_id      :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Photo < ApplicationRecord
  belongs_to :attachable, polymorphic: true, optional: true
  
  has_attached_file :image, 
  :path => ":rails_root/public/images/:id/:filename",
  :url  => "/images/:id/:filename" , 
  :styles => {
    :thumb => "100x100#" },
  :convert_options => {
    :thumb => "-quality 75 -strip" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
end
