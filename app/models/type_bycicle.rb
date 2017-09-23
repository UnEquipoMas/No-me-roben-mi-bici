# == Schema Information
#
# Table name: type_bycicles
#
#  id          :integer          not null, primary key
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class TypeBycicle < ApplicationRecord
    has_many: bycicles
end
