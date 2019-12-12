class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def index
    @reservations = current_user.reservations
  end

  # def show ;end

  def new
    @userPets = current_user.pets
    @reserveSpace = Space.find(params[:space_id])
    @reservation = Reservation.new
  end

  def create
    reservation = current_user.reservations.create(reservation_params)
    redirect_to spaces_path
  end


  # def edit ;end

  # def update ;end

  # def destroy
  #   favorite = current_user.favorites.find_by(id: params[:id]).destroy
  #   redirect_to spaces_path
  # end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:end_date, :start_date, :status, :user_id, :space_id, :pet_id)
  end

end
