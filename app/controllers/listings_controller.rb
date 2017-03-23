class ListingsController < ApplicationController

  def new
    @listing = current_user.listings.new
    # render template: "listings/new"
  end

  def create
    @listing
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

end
