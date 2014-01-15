class AddAttachmentPlacePhotoToPlaces < ActiveRecord::Migration
  def self.up
    change_table :places do |t|
      t.attachment :place_photo
    end
  end

  def self.down
    drop_attached_file :places, :place_photo
  end
end
