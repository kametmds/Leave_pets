class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  before_action -> {forbid_wrong_user(@pet)}, only: [:edit, :update, :destroy]

  def show
  end

  def new
    @pet = Pet.new
  end

  def edit
  end

  def create
    @pet = current_user.pets.build(pet_params)
    if @pet.save
      redirect_to @pet, notice: 'ペット情報作成しました'
    else
      render :new
    end
  end

  def update
    if @pet.update(pet_params)
      redirect_to @pet, notice: 'ペット情報更新しました'
    else
      render :edit
    end
  end

  def destroy
    @pet.destroy
    redirect_to user_path(current_user), notice: 'ペット情報削除しました'
  end

  private
    def set_pet
      @pet = Pet.find(params[:id])
    end

    def pet_params
      params.require(:pet).permit %i(name age size weight content image image_cache)
    end
end
