class AddAttachmentImageToPlaceGalleries < ActiveRecord::Migration
  def self.up
    change_table :place_galleries do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :place_galleries, :image
  end
end
