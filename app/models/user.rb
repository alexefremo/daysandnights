class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
  user = User.where(:provider => auth.provider, :uid => auth.uid).first
  unless user
    user = User.create(  profile_name:auth.extra.raw_info.first_name+auth.extra.raw_info.last_name,
                         provider:auth.provider,
                         uid:auth.uid,
                         email:auth.info.email,
                         gender:auth.extra.raw_info.gender,
                         right:'user',
                         password:Devise.friendly_token[0,20]
                         )
  end
  user
end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  validates :profile_name, presence: true,
  uniqueness: true, format: {
	with: /\A[a-zA-Z0-9_-]*\z/,
	message: 'Must be formatted correctly: no spaces'
  }

  has_many :news
  has_many :place
  has_many :event
  has_many :place_type
  has_many :subscription

end
