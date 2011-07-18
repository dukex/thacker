require 'spec_helper'

describe Event do
  should_belong_to :author, :class_name => "User"
end
