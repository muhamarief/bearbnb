class Listing < ActiveRecord::Base

  validates :title, :room_type, :google_address, presence: true
  has_many :reservations
  belongs_to :user, :dependent => :destroy

  mount_uploaders :photos, PhotosUploader

end
