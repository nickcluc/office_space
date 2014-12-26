class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    listing = Listing.new(listing_params) 
    if listing.save!
      flash[:notice] = "Successfully Created Listing"
      redirect_to listings_path
    else
      flash.now[:notice] = "Your Listing Couldn't Be Saved"
      render :new
    end
  end

  private

  def listing_params
    params.require(:listing).permit(
      :title,
      :address,
      :city,
      :state,
      :zip_code,
      :description,
      :daily_rate_cents
    )
  end
end
