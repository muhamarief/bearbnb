class Reservation < ActiveRecord::Base
  # before_create :set_bookings_date
  before_create :set_total_price

  validates :start_date, :end_date, presence: true

  belongs_to :user
  belongs_to :listing



  def date_confirmation
    # byebug
    self.start_date < self.end_date
  end

  def set_total_price
    self.total_price = (self.start_date..self.end_date).to_a.length * self.listing.price
  end

  def overlap?(reservation,booking)
    (reservation.start_date - booking.end_date) * (booking.start_date - reservation.end_date) > 0
  end

  def available_dates?(listing_dates)
    (self.start_date..self.end_date).each do |date|
      return false if !(listing_dates.start_date..listing_dates.end_date).include?(date)
    end
    return true
  end

  def overlap_dates?(bookings)
    bookings.each do |x|
      return true if overlap?(self,x)
    end
    return false
  end

end
