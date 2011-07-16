require 'spec_helper'

describe User do
  describe "on after create" do
    it "should create a PostLiveStream" do
      user = Factory(:user)
      UserLiveStream.last.user.should == user
    end
  end
end
