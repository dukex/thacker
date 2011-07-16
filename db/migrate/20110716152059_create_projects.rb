class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :about
      t.string :url
      t.string :source_url
      t.text :skills
      t.references :author
      t.references :status

      t.timestamps
    end
    add_index :projects, :author_id
    add_index :projects, :status_id
  end
end
