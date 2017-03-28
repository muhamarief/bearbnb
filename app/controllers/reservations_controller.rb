class ReservationsController < ApplicationController

  def new

  end

  def create
    @listing = Listing.find(params[:listing_id])
    @reservation = current_user.reservations.new(reservation_params)
    if @reservation.date_confirmation
      @reservation.listing_id = @listing.id
      if @reservation.save
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
