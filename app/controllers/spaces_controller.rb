class SpacesController < ApplicationController
  before_action :set_space, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]
  before_action -> {forbid_wrong_user(@space)}, only: [:edit, :update, :destroy]

  def index
    @recentSpaces = Space.all.order(created_at: :desc)[0..7]
    @mostReviewSpaces = Space.reviewest[0..3]
    @tags = ActsAsTaggableOn::Tag.most_used(20)
  end

  def search
    @spaces = Space.all
    if params[:tag_name].present?
      @spaces = Space.all.tagged_with(params[:tag_name]).reviewest[0..]
    elsif params[:sort_created]
      @spaces = @spaces.order(created_at: :desc)
    elsif params[:sort_popular]
      @spaces = @spaces.reviewest[0..]
    end
  end

  def show
    @user = User.find(@space.user.id)
    connect_room if user_signed_in?
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

  def intro
  end

  private
  def set_space
    @space = Space.find(params[:id])
  end

  def space_params
    params.require(:space).permit(:title, :picture, :picture_cache, :postal, :address,
                                  :tel, :content, :capacity, :tag_list, :user_id, :latitude, :longitude,
                                  subphotos_attributes: [:id, :subpicture, :subpicture_cache, :space_id, :_destroy])
  end
end
