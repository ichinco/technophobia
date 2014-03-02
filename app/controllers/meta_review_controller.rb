class MetaReviewController < ApplicationController
  before_filter :authenticate_user!

  def create
    @technology = Technology.find(params[:technology_id])
    @text_review = TextReview.find {params[:text_review_id]}

    @meta_review = MetaReview.where(:user_id=>current_user.id).where(:text_review_id=>@text_review.id)
    if @meta_review.length == 0
      @meta_review = MetaReview.new(review_params)
      @meta_review.text_review=@text_review
      @meta_review.user = current_user
    else
      @meta_review = @meta_review[0]
      @meta_review.valiance = review_params[:valiance]
    end

    if @meta_review.save
      redirect_to tech_path(@technology)
    end
  end

  private
    def review_params
      params.require(:meta_review).permit(:valiance)
    end
end
