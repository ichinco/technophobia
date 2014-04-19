class NumericReviewController < ApplicationController
  before_filter :authenticate_user!

  def create
    @technology = Technology.find(params[:technology_id])
    @review_type = ReviewType.find(params[:review_type_id])

    @text_review = NumericReview.where(:user_id=>current_user.id).where(:review_type_id=>@review_type.id).where(:technology_id=>@technology.id)
    if @text_review.length == 0
      @text_review = NumericReview.new(review_params)
      @text_review.technology = @technology
      @text_review.review_type = @review_type
      @text_review.user = current_user
    else
      @text_review = @text_review[0]
      @text_review.review = review_params[:review]
    end

    if @text_review.save
      redirect_to technology_path(@technology)
    else
      redirect_to technology_path(@technology)
    end
  end

  private
    def review_params
      params.require(:review).permit(:review)
    end
end
