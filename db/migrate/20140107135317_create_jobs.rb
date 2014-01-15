class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :place_id
      t.text :content

      t.timestamps
    end
  end
end
