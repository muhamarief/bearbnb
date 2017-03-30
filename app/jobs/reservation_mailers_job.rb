class ReservationMailersJob < ApplicationJob
  queue_as :default

  def perform(reservation)
    ReservationMailer.booking_created_customer_email(reservation).deliver_now
    ReservationMailer.booking_created_host_email(reservation).deliver_now
  end

end
