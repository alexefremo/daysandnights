class Advertise < ActiveRecord::Base
  before_create :create_slug

  def to_param
    slug
  end
    
  def create_slug
    self.slug = self.title.parameterize
  end

  belongs_to :user

  validates :title, uniqueness: true

  has_attached_file :advertise_photo, :styles => { :small => "100x120#", :medium => "240x280#" },
                  :url  => "/assets/advertise/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/advertise/:id/:style/:basename.:extension"

  validates_attachment_presence :advertise_photo
  validates_attachment_size :advertise_photo, :less_than => 5.megabytes
  validates_attachment_content_type :advertise_photo, :content_type => ['image/jpeg', 'image/png']

end
