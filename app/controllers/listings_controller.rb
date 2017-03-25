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
  end

  def index
  end

  def edit
  end

  def update
  end

  def delete
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :property_type, :room_type, :google_address, :start_date, :end_date, :user_id, :accomodate, :wifi, :kitchen, :bed, :parking_spot, :smoke, :pet, :phone_number, :email, :bathroom, :price, :city)
  end




end
