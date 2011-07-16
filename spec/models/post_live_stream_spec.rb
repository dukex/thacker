require 'spec_helper'

describe PostLiveStream do
  should_validate_presence_of :user
  should_validate_presence_of :post
end
