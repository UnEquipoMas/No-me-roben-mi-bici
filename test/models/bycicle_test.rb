# == Schema Information
#
# Table name: bycicles
#
#  id          :integer          not null, primary key
#  serial      :string           not null
#  state       :boolean          not null
#  color       :string           not null
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  mode_id     :integer
#  brand_id    :integer
#  user_id     :integer
#

require 'test_helper'

class BycicleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
