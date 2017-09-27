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
end
