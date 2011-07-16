require 'spec_helper'

describe Post do
  should_belong_to :user
  should_validate_presence_of :title
  should_validate_presence_of :body
  should_validate_presence_of :user
end
