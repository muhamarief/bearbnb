class ListingsController < ApplicationController

  def new
    @listing = current_user.listings.new
    # render template: "listings/new"
  end

  def create
    # listing_params[:start_date] = Date.strptime(params[:listing][:start_date],'%m/%d/%Y')
    # listing_params[:end_date] = Date.strptime(params[:listing][:end_date],'%m/%d/%Y')
    @listing = current_user.listings.new(listing_params)
    a = Date.strptime(params[:listing][:start_date],'%m/%d/%Y')
    b = Date.strptime(params[:listing][:end_date],'%m/%d/%Y')

    @listing.start_date = a
    @listing.end_date = b

    if @listing.save
      redirect_to '/'
    else
      render template: 'listings/new'
    end
  end

  def show
    @listing = Listing.find(params[:id])
    @unavailable_dates = @listing.disable_dates
    @reservation = @listing.reservations.new
    # return unavailable_dates.to_json
  end

  def index
  end

  def edit
  end

  def update
  end

  def delete
  end

  private
  def listing_params
    params.require(:listing).permit(:title, :description, :property_type, :room_type, :google_address, :start_date, :end_date, :user_id, :accomodate, :wifi, :kitchen, :bed, :parking_spot, :smoke, :pet, :phone_number, :email, :bathroom, :price, :city, {photos: []})
  end




end
