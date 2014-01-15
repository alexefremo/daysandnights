class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :place_id
      t.integer :user_id
      t.string :user_gender

      t.timestamps
    end
  end
end
