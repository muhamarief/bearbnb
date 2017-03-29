class ReservationMailer < ApplicationMailer

  default from: 'marief.rahman279@gmail.com'

  def booking_created_customer_email(reservation)
    @customer = reservation.user
    @host = reservation.listing.user
    @url = "localhost://3000/listings/#{reservation.listing_id}/reservations/#{reservation.id}"
    mail(to: "#{@customer.email}", subject: "You have sent a booking request to #{@host.first_name}")

  end

  def booking_created_host_email(reservation)
    @customer = reservation.user
    @host = reservation.listing.user
    @url = "localhost://3000/listings/#{reservation.listing_id}/reservations/#{reservation.id}"
    mail(to: "#{@host.email}", subject: "You have received a booking from #{@customer}")
  end

end
