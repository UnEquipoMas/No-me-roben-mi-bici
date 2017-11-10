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
  
  # test 'valid site' do
  #   site = Site.new(name: 'Prueba', lat:'47', lng: '43', report_id:1)
  #   assert site.valid?
  # end

  test 'invalid with just name' do
    site = Site.new(name: 'Simon bolivar')
    refute site.valid?
    assert_not_nil site.errors[:name]
  end

end
