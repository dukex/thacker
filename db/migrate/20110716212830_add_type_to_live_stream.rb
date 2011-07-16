class AddTypeToLiveStream < ActiveRecord::Migration
  def change
    add_column :live_streams, :type, :string
  end
end
