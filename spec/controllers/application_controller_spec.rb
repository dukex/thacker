require 'spec_helper'

describe ApplicationController do
  describe "livestream" do
    it "should assigns @status as all livestream" do
      stream = [ Factory(:live_stream), Factory(:live_stream) ].reverse
      get :livestream
      assigns(:stream).should == stream
    end
  end
end
