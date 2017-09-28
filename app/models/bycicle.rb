# == Schema Information
#
# Table name: bycicles
#
#  id              :integer          not null, primary key
#  serial          :string           not null
#  state           :boolean          not null
#  color           :string           not null
#  description     :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  type_bycicle_id :integer
#  brand_id        :integer
#  user_id         :integer
#

class Bycicle < ApplicationRecord
    belongs_to :brand
    belongs_to :user
    belongs_to :type_bycicle
end
