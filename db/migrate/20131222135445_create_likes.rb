class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :event_id
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
