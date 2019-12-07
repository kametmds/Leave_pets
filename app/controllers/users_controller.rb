class UsersController < ApplicationController
  def show
    @user = User.find(params[:format])
    connect_room#UsersHelper
  end
end
