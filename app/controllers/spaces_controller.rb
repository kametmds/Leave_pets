class SpacesController < ApplicationController
  before_action :set_space, only: [:show, :edit, :update, :destroy]
  before_action -> {forbid_wrong_user(@space)}, only: [:edit, :update, :destroy]

  def index
    @spaces = Space.all
    @tags = ActsAsTaggableOn::Tag.most_used(20)
    if params[:tag_name]
      @spaces = @spaces.tagged_with(params[:tag_name])
    end
  end


  def show
    connect_room#UsersHelper
    @reviews = @space.reviews.includes(:user).all
    @review = @space.reviews.build(user_id: current_user.id) if current_user
    @reviewsRate = rating_average(@space) if @reviews.present?
  end

  def new
    @space = Space.new
    5.times { @space.subphotos.build }
  end

  def edit
  end

  def create
    @space = current_user.spaces.build(space_params)
    if @space.save
      redirect_to @space, notice: 'スペース情報作成しました'
    else
      render :new
    end
  end

  def update
    if @space.update(space_params)
      redirect_to @space, notice: 'スペース情報更新しました'
    else
      render :edit
    end
  end

  def destroy
    @space.destroy
    redirect_to spaces_url, notice: 'スペース情報削除しました'
  end

  private
  def set_space
    @space = Space.find(params[:id])
  end

  def space_params
    params.require(:space).permit(:title, :picture, :picture_cache, :postal, :address,
                                  :tel, :content, :capacity, :tag_list, :user_id,
                                  subphotos_attributes: [:id, :subpicture, :subpicture_cache, :space_id, :_destroy])
  end
end
