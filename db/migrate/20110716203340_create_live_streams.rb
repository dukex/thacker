class CreateLiveStreams < ActiveRecord::Migration
  def change
    create_table :live_streams do |t|
      t.references :user
      t.references :project
      t.references :post

      t.timestamps
    end
    add_index :live_streams, :user_id
    add_index :live_streams, :project_id
    add_index :live_streams, :post_id
  end
end
