class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.float :latitude
      t.float :longitude
      t.string :title
      t.string :slug
      t.integer :user_id
      t.integer :place_type_id
      t.text :content
      t.string :address
      t.time :mon_start
      t.time :mon_end
      t.time :tue_start
      t.time :tue_end
      t.time :wed_start
      t.time :wed_end
      t.time :thu_start
      t.time :thu_end
      t.time :fri_start
      t.time :fri_end
      t.time :sat_start
      t.time :sat_end
      t.time :sun_start
      t.time :sun_end

      t.timestamps
    end
  end
end
