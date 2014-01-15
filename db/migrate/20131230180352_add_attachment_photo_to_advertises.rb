class AddAttachmentPhotoToAdvertises < ActiveRecord::Migration
  def self.up
    change_table :advertises do |t|
      t.attachment :advertise_photo
    end
  end

  def self.down
    drop_attached_file :advertises, :advertise_photo
  end
end
