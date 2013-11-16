class ReviewController < ApplicationController
  def new
  end

  def index
    @reviews = Review.all
  end

  def create
    @review = Review.new(params[:review])
    @review.save
    redirect_to @review
  end

  private
    def review_params
      params.require(:review).permit(:version_used,
                                     :overall_rating,
                                     :development_status,
                                     :community,
                                     :maturity,
                                     :what_makes_it_unique,
                                     :what_is_it_good_at,
                                     :what_is_it_bad_at,
                                     :general_comments)
    end
end
