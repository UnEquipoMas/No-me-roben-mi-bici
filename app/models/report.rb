class Report < ApplicationRecord
    belongs_to: type_report
    belongs_to: site
    belongs_to: bycicle
    belongs_to: user
    belongs_to: mode
    has_many: comments
    has_many: photo_reports
end
