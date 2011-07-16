class PostsController < InheritedResources::Base
  before_filter :authenticate_user!, :only => :new
  before_filter :set_user, :only => :create


  private

  def set_user
    params[:post][:user] = current_user
  end

end
