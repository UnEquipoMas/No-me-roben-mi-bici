# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  report_id  :integer
#  user_id    :integer
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
