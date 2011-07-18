class AddEventIdToLiveStream < ActiveRecord::Migration
  def change
    add_column :live_streams, :event_id, :integer
  end
end
