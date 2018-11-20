class UsersController < ApplicationController
  def dashboard
     @booked_vacuums = current_user.booked_vacuums
     @bookings = current_user.bookings
  end

  def virds
    @vacuums = current_user.owned_vacuums
  end
end
