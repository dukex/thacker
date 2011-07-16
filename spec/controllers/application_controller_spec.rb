require 'spec_helper'

describe ApplicationController do
  describe "livestream" do
    it "should assigns @status as all livestream" do
      status = [ Factory(:live_stream), Factory(:live_stream) ]
      get :livestream
      assigns(:status).should == status
    end
  end
end
