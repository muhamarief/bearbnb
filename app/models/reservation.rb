class Reservation < ActiveRecord::Base

  validates :start_date, :end_date, presence: true

  belongs_to :user
  belongs_to :listing

  def date_confirmation
    self.start_date < self.end_date
  end

end
