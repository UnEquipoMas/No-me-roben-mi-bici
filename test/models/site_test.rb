# == Schema Information
#
# Table name: sites
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  lat        :string           not null
#  lng        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  report_id  :integer
#

require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
