class ImageAttachment < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  has_attached_file :data,
    styles:          { thumb:  '120x120#',            medium: '600x600>'           },
    convert_options: { thumb:  '-quality 75 -strip',  medium: '-quality 90 -strip' },
    :path => ":rails_root/public/images/:id/:filename",
    :url  => "/images/:id/:filename"

  do_not_validate_attachment_file_type :image

   #validates_attachment_presence     :data
  #validates_attachment_size         :data, less_than:    0.5.megabytes
  #validates_attachment_content_type :data, content_type: PAPERCLIP_IMAGE_CONTENT_TYPE


  # Conditional Uniqueness validation on the belongs_to scope
   #validates :default, uniqueness: { scope: :imageable }, if: :default?


  # Methods to set/unset the default image
  def undefault!
    update(default: false)
  end

  def default!
    imageable.default_image.undefault! if imageable.default_image
    update(default: true)
  end
 end