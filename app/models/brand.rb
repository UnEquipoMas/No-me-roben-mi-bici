# == Schema Information
#
# Table name: brands
#
#  id          :integer          not null, primary key
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Brand < ApplicationRecord
    has_many: bycicles
end
