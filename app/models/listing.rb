class Listing < ActiveRecord::Base

  validates :title, :room_type, :google_address, presence: true
  has_many :reservations
  belongs_to :user, :dependent => :destroy

  mount_uploaders :photos, PhotosUploader

  def disable_dates
    disabled_array = []
    self.reservations.each do |x|
      start = x.start_date
      last = x.end_date
      disabled_array << (start..last).to_a
    end
    disabled_array.flatten
  end

end
