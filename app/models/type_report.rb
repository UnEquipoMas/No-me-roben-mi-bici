# == Schema Information
#
# Table name: type_reports
#
#  id          :integer          not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class TypeReport < ApplicationRecord
    has_many :reports
    validates :description, presence: { message: 'Debe ingresar una referencia del tipo de reporte' }
end
