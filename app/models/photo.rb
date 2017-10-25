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
