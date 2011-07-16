class PostLiveStream < LiveStream
  validates_presence_of :user
  validates_presence_of :post
end
