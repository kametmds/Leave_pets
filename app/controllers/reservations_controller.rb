class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def index
    @reservations = current_user.reservations
  end

  def show
  end

  def new
    @userPets = current_user.pets
    @reserveSpace = Space.find(params[:space_id])
    @reservation = Reservation.new
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    if @reservation.save
      flash[:notice] = "予約申請しました"
      redirect_to spaces_path
    else
      render :new
    end
  end


  # def edit ;end

  # def update ;end

  # def destroy
  #   resercation = current_user.resercations.find_by(id: params[:id]).destroy
  #   redirect_to users_show_path(current_user)
  # end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # def start_date_join
  #   date = params[:reservation][:start_date]
  #   if date["start_date(1i)"].empty? && date["start_date(2i)"].empty? && date["start_date(3i)"].empty?
  #     return
  #   end
  #   Date.new date["start_date(1i)"].to_i,date["start_date(2i)"].to_i,date["start_date(3i)"].to_i
  # end

  # def end_date_join
  #   date = params[:reservation][:end_date]
  #   if date["end_date(1i)"].empty? && date["end_date(2i)"].empty? && date["end_date(3i)"].empty?
  #     return
  #   end
  #   Date.new date["end_date(1i)"].to_i,date["end_date(2i)"].to_i,date["end_date(3i)"].to_i
  # end

  def reservation_params
    # params[:reservation][:start_date ] = start_date_join
    # params[:reservation][:end_date ] = end_date_join
    params.require(:reservation).permit(:end_date, :start_date, :status, :user_id, :space_id, :pet_id, pet_ids: [])
  end

end
