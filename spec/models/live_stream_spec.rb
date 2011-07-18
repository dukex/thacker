require 'spec_helper'

describe LiveStream do
  should_belong_to :user
  should_belong_to :project
  should_belong_to :post
  should_validate_presence_of :user
  describe "type" do
    %w{post project user}.each do |type|
      it "should be #{type}" do
        stream = Factory(:"#{type}_live_stream")
        stream.type.should == type
      end
    end
  end
end
