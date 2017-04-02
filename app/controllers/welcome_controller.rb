class WelcomeController < ApplicationController

  def index
    @counter ||= 0 unless @counter

    @listings = Listing.all
    if params[:value] == nil
      @listings_per_page = Listing.all.limit(10).offset(@counter)
    else
      @counter += params[:value].to_i
      @listings_per_page = Listing.all.limit(10).offset(@counter)
    end
  end

  def edit
    
  end


end
