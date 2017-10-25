# == Schema Information
#
# Table name: photo_reports
#
#  id            :integer          not null, primary key
#  photo_address :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  report_id     :integer
#

class PhotoReport < ApplicationRecord
    belongs_to :report
    
    has_attached_file :image,
    :path => ":rails_root/public/images/:id/:filename",
    :url  => "/images/:id/:filename"

  do_not_validate_attachment_file_type :image
    
end
