class ReviewsController < ApplicationController
  before_action -> {ensure_wrong_user(Space.find(params[:space_id]))}, only: [:create]
  before_action -> {forbid_wrong_user(Review.find(params[:id]))}, only: [:destroy]
  before_action :authenticate_user!

  def create
    @space = Space.find(params[:space_id])
    @review = @space.reviews.build(review_params)
    respond_to do |format|
      if @review.save
        format.js { render :index }
      else
        format.html { redirect_to space_path(@space), notice: '投稿できませんでした。' }
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    respond_to do |format|
      if @review.destroy
        format.js { render :index }
      end
    end
  end

  private
  def review_params
    params.require(:review).permit(:space_id, :user_id, :comment, :rate)
  end
end
