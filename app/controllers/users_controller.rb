class UsersController < ApplicationController
  def dashboard
     @booked_vacuums = current_user.booked_vacuums
     @bookings = current_user.bookings
  end
end
