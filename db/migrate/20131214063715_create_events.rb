class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :slug
      t.integer :user_id
      t.text :content
      t.integer :place_id
      t.datetime :start_date
      t.time :end_time
      t.string :published
      t.integer :like_count, :default => 0

      t.timestamps
    end
  end
end
