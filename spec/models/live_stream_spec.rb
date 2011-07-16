require 'spec_helper'

describe LiveStream do
  describe "type" do
    %w{post project user}.each do |type|
      it "should be #{type}" do
        stream = Factory(:"#{type}_live_stream")
        stream.type.should == type
      end
    end
  end
end
