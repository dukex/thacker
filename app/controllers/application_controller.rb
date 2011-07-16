class ApplicationController < ActionController::Base
  protect_from_forgery

  def livestream
    @stream = LiveStream.all
  end
end
