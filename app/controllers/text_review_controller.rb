class TextReviewController < ApplicationController

  before_filter :authenticate_user!

  def new
    @technology = Technology.find(params[:technology_id])
    @review_type = ReviewType.find(params[:review_type_id])

  end

  def create
    @technology = Technology.find(params[:technology_id])
    @review_type = ReviewType.find(params[:review_type_id])

    @text_review = TextReview.new(review_params)
    @text_review.technology = @technology
    @text_review.review_type = @review_type
    @text_review.user = current_user

    if @text_review.save
      redirect_to tech_path(@technology)
    else
      render 'new'
    end
  end

  private
    def review_params
      params.require(:review).permit(:review)
    end
end
