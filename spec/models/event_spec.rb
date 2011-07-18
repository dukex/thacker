require 'spec_helper'

describe Event do
  should_belong_to :author, :class_name => "User"
  should_validate_presence_of :name
  should_validate_presence_of :author
  should_validate_presence_of :about

  describe "on after create" do
    it "should create a EventLiveStream" do
      event = Factory(:event)
      EventLiveStream.last.event.should == event
    end
  end
end
