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
    include Imageable
    belongs_to :brand
    belongs_to :user
    belongs_to :type_bycicle
    validates_associated :brand
    validates_associated :user
    validates_associated :type_bycicle
    validates :serial, uniqueness: true, presence: { message: 'Debe ingresar un serial único' }
    validates :color, presence: { message: 'Debe ingresar un color' }
    validates :description, presence: { message: 'Debe ingresar una descripcion' }
end
