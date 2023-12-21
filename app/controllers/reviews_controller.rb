class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def create
    @reviewable = find_reviewable
    @review = @reviewable.reviews.build(review_params)

    if @review.save
      redirect_to reviewable_path(@reviewable)
    else
      render "reviewables/show", status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @reviewable = @review.reviewable
    @review.destroy

    redirect_to reviewable_path(@reviewable)
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  def find_reviewable
    if params[:user_id]
      User.find(params[:user_id])
    elsif params[:product_id]
      Product.find(params[:product_id])
    end
  end

  def reviewable_path(reviewable)
    if reviewable.is_a?(User)
      user_path(reviewable)
    elsif reviewable.is_a?(Product)
      product_path(reviewable)
    end
  end
end
