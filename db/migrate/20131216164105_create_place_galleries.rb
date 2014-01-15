class CreatePlaceGalleries < ActiveRecord::Migration
  def change
    create_table :place_galleries do |t|
      t.integer :place_id

      t.timestamps
    end
  end
end
