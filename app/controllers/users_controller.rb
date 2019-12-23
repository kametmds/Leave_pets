class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    connect_room
    @spaces = @user.spaces
    @userReviews = @user.spaces.joins(:reviews).where("reviews.id IS NOT NULL")
    @userReservations = @user.spaces.joins(:reservations).where("reservations.id IS NOT NULL")
  end
end
