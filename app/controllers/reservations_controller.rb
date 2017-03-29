class ReservationsController < ApplicationController

  def new

  end

  def create
    @listing = Listing.find(params[:listing_id])

    a = Date.strptime(params[:reservation][:start_date],'%m/%d/%Y')
    b = Date.strptime(params[:reservation][:end_date],'%m/%d/%Y')

    @reservation = current_user.reservations.new(start_date: a, end_date: b)
    # @reservation.listing_id = params[:listing_id]

    if @reservation.date_confirmation && !@reservation.overlap_dates?(@listing.reservations) && @reservation.available_dates?(@listing)
      @reservation.listing_id = @listing.id
      if @reservation.save
        ReservationMailer.booking_created_customer_email(@reservation).deliver_now
        ReservationMailer.booking_created_host_email(@reservation).deliver_now
        redirect_to '/'
      else
        redirect_to listings_path(Listing.find(params[:id]))
      end
    else
      flash[:error] = "Reservation failed"
      redirect_to listing_path(@listing)
    end
  end

  def show

  end

  def index

  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :rating, :comment, :user_id, :listing_id)
  end

end
