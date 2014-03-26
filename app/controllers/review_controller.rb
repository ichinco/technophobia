class ReviewController < ApplicationController
  before_filter :authenticate_user!

  def new
    @technology = Technology.find(params[:technology_id])
  end

  def create
    @technology = Technology.find(params[:technology_id])
    @review = @technology.reviews.create(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to tech_path(@technology)
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
