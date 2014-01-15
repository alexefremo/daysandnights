class CreateAdvertises < ActiveRecord::Migration
  def change
    create_table :advertises do |t|
      t.string :title
      t.string :url
      t.date :starts
      t.string :slug

      t.timestamps
    end
  end
end
