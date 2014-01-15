class CreatePlaceTypes < ActiveRecord::Migration
  def change
    create_table :place_types do |t|
      t.string :title
      t.string :slug
      t.string :category
      t.timestamps
    end
  end
end
