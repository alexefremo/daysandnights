class PlaceGallery < ActiveRecord::Base

belongs_to :place
has_attached_file :image,
    :styles => {
 :small => "190x100", :large => "800x600>" 
        },
                  :url  => "/assets/place_galleries/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/place_galleries/:id/:style/:basename.:extension"
end
