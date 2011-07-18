require 'spec_helper'

describe ApplicationController do
  describe "livestream" do
    it "should assigns @status as all livestream" do
      user = Factory(:user)
      stream = [ LiveStream.first, Factory(:live_stream, :user => user), Factory(:live_stream, :user => user) ].reverse
      get :livestream
      assigns(:stream).should == stream
    end
  end
end
