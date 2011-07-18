class Event < ActiveRecord::Base
  validates_presence_of :name, :author, :about
  belongs_to :author, :class_name => "User"
end
