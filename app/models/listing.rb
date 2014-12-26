class Listing < ActiveRecord::Base

  validates :title, :address, :city, :state, :zip_code, :daily_rate_cents, presence: true
end
