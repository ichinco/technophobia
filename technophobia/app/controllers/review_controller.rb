class ReviewController < ApplicationController
  def new
    @technology = Technology.find(params[:technology_id])
  end

  def index
    @technology = Technology.find(params[:technology_id])
    @reviews = @technology.reviews
  end

  def create
    @technology = Technology.find(params[:technology_id])
    @review = @technology.reviews.create(review_params)
    if @review.save
      redirect_to technology_path(@technology)
    else
      render 'new'
    end
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
