class Place < ActiveRecord::Base
  before_create :create_slug
 
  geocoded_by :address
  after_validation :geocode
   
  def to_param
    slug
  end
    
  def create_slug
    self.slug = self.title.parameterize
  end

  validates :title, uniqueness: true



  has_attached_file :place_photo, :styles => { :small => "200x200#", :medium => "370x225#", :large => "600x400" },
                  :url  => "/assets/places/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/places/:id/:style/:basename.:extension"

  validates_attachment_presence :place_photo
  validates_attachment_size :place_photo, :less_than => 5.megabytes
  validates_attachment_content_type :place_photo, :content_type => ['image/jpeg', 'image/png']

  belongs_to :user
  belongs_to :place_type
  has_many :subscription
  has_many :like
  has_many :jobs
  has_many :place_galleries, :dependent => :destroy
  accepts_nested_attributes_for :place_galleries, :jobs, :allow_destroy => true

  searchable do
    text :title, :content
  end

end
