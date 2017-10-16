class ImageAttachment < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  has_attached_file :data,
    styles:          { thumb:  '120x120#',            medium: '600x600>'           },
    convert_options: { thumb:  '-quality 75 -strip',  medium: '-quality 90 -strip' }

  validates_attachment_presence     :data
  validates_attachment_size         :data, less_than:    5.megabytes
  validates_attachment_content_type :data, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  # Conditional Uniqueness validation on the belongs_to scope
  validates :default, uniqueness: { scope: :imageable }, if: :default?


  # Methods to set/unset the default image
  def undefault!
    update(default: false)
  end

  def default!
    imageable.default_image.undefault! if imageable.default_image
    update(default: true)
  end
end