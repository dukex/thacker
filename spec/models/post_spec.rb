require 'spec_helper'

describe Post do
  should_belong_to :user
  should_validate_presence_of :title
  should_validate_presence_of :body
  should_validate_presence_of :user

  describe "on after create" do
    it "should create a PostLiveStream" do
      post = Factory(:post)
      PostLiveStream.last.post.should == post
    end
  end
end
