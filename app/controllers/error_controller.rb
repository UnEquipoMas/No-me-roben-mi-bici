class ErrorController < ApplicationController
  def not_found
    respond_to do |format|
      format.html { render status: 404 }
      format.any  { render text: "404 Not Found", status: 404 }
    end
  end

  def internal_server_error
    respond_to do |format|
      format.html { render status: 500 }
      format.any  { render text: "500 error server", status: 500 }
    end
  end
end
