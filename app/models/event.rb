class Event < ActiveRecord::Base
  validates_presence_of :name, :author, :about
  belongs_to :author, :class_name => "User"

  after_create :create_live_stream

  private

  def create_live_stream
    EventLiveStream.create! :event_id => id, :user => author
  end
end
