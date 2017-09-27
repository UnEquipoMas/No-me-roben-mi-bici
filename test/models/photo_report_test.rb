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

require 'test_helper'

class PhotoReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
