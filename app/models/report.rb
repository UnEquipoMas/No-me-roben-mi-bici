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

class Report < ApplicationRecord
    belongs_to :type_report
    has_many :image_attachments, as: :imageable, dependent: :destroy
    has_one :site, inverse_of: :report
    accepts_nested_attributes_for :site
    belongs_to :bycicle
    belongs_to :user
    belongs_to :mode
    has_many :comments, dependent: :destroy
    has_many :photo_reports, :dependent => :destroy
    has_many :photos, :as => :attachable
    accepts_nested_attributes_for :photos
    
    def self.search(search)
        where("description LIKE ? ", "%#{search}%") 
    end
    validates_with CantSeeTheFuture
    def self.mi_reporte(id)
       where(user_id: id) 
    end

end
