class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :about
      t.references :author
      t.text :skills
      t.string :address

      t.timestamps
    end
    add_index :events, :author_id
  end
end
