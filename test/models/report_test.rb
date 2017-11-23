# == Schema Information
#
# Table name: reports
#
#  id             :integer          not null, primary key
#  date           :date
#  hour           :time
#  description    :text
#  state          :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  type_report_id :integer
#  user_id        :integer
#  mode_id        :integer
#  bycicle_id     :integer
#

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "no debe guardar"  do
    report= reports(:one)
    assert report.save
  end
  
    
  test "deberia guardar"  do
    report= reports(:two)
    assert report.save
  end
  
end
