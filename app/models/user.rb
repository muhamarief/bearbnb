class User < ActiveRecord::Base
  include Clearance::User

  # validates :passport_number, :phone_number, uniqueness: true
  validates :email, uniqueness:{ message: "Your email has already been taken!"}
  validates :email, presence: { message: "You need to type in an email!"}

  has_many :authentications, :dependent => :destroy
  has_many :listings, :dependent => :destroy
  has_many :reservations

  enum role: ['user', 'moderate', 'superadmin']
  mount_uploader :avatar, AvatarUploader


  def self.create_with_auth_and_hash(authentication,auth_hash)
    create! do |u|
      # u.first_name = auth_hash["info"]["first_name"]
      # u.last_name = auth_hash["info"]["last_name"]
      # u.friendly_name = auth_hash["info"]["name"]
      u.email = auth_hash["extra"]["raw_info"]["email"]
      u.password = SecureRandom.hex(6)
      u.authentications<<(authentication)
    end

  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

end
