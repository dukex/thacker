class ApplicationController < ActionController::Base
  protect_from_forgery

  def livestream
    @status = LiveStream.all
  end
end
