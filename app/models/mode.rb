# == Schema Information
#
# Table name: modes
#
#  id          :integer          not null, primary key
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Mode < ApplicationRecord
    has_many :reports
    validates_associated :report
    validates :description, presence: { message: 'Debe ingresar una descripcion para la forma de robo' }
end
