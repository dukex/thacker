require 'spec_helper'

describe Project do
  should_belong_to :author, :class_name => "User"
end
