class ListingsController < ApplicationController

  def new
    @listing = current_user.listings.new
    # render template: "listings/new"
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      redirect_to '/'
    else
      render template: 'listings/new'
    end
  end

  def show
    @listing = Listing.find(params[:id])
    @reservation = @listing.reservations.new
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
