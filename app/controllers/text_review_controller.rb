class TextReviewController < ApplicationController
  def new
    @technology = Technology.find(params[:technology_id])
    @review_type = ReviewType.find(params[:review_type_id])

  end

  def create

  end
end
