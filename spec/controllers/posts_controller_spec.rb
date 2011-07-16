require 'spec_helper'

describe PostsController do
  with_a_logged_user do
    describe "POST create" do
      it "should set user as current user" do
        post :create, :post => { :title => "Ola", :body => "Mundo"}
        Post.last.user.should == user
      end
    end
  end
end
