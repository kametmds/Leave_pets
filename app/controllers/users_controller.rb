class UsersController < ApplicationController
  def show
    @user = User.find(params[:format])
    connect_room#UsersHelper
    @spaces = @user.spaces
    @userReviews = @user.spaces.joins(:reviews).where("reviews.id IS NOT NULL")
  end
end
