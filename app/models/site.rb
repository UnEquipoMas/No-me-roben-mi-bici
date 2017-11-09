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

class Site < ApplicationRecord
   belongs_to :report
   validates_associated :report
   validates :name, presence: { message: 'Debe ingresar un lugar' }
   validates :lat, presence: { message: 'Debe ingresar un lugar' }
   validates :lng, presence: { message: 'Debe ingresar un lugar' }
end
