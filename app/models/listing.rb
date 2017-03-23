class Listing < ActiveRecord::Base

  validates :title, :room_type, :google_address, presence: true
  belongs_to :user, :dependent => :destroy

end
