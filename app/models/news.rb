class News < ActiveRecord::Base
  before_create :create_slug
  
  def to_param
    slug
  end
    
  def create_slug
    self.slug = self.title.parameterize
  end

  validates :title, uniqueness: true

  belongs_to :user
end
