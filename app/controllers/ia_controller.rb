class ImageAttachmentsController < ApplicationController

  def create
    @image_attachment = ImageAttachment.new(params[:image_attachments])
  end

end