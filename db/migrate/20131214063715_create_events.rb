class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :slug
      t.integer :user_id
      t.text :content
      t.integer :place_id
      t.date :start_date
      t.time :start_time
      t.time :end_time
      t.string :published

      t.timestamps
    end
  end
end
