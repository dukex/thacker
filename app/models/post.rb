class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :body, :user

  after_create :create_live_stream

  private

  def create_live_stream
    PostLiveStream.create! :post_id => id, :user => user
  end
end
