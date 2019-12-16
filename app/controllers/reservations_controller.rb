class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action -> {forbid_wrong_user(@reservation.space)}, only: [:edit, :update, :destroy]

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


  def edit ;end

  def update
    if @reservation.update(reservation_params)
      redirect_to @reservation, notice: '予約情報更新しました'
    else
      render :edit
    end
  end

  # def destroy
  # end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:end_date, :start_date, :status, :user_id, :space_id, :pet_id, pet_ids: [])
  end
end
