class ReviewsController < ApplicationController
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
    params.require(:review).permit(:space_id, :user_id, :comment, :title, :rate)
  end
end
