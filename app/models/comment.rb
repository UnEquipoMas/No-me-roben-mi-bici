# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  report_id  :integer
#  user_id    :integer
#

class Comment < ApplicationRecord
    belongs_to :report
    belongs_to :user
    validates_associated :user
    validates_associated :report
    validates :content, presence: { message: 'Debe ingresar un mensaje' }
end
