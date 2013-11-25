module TechHelper

  def construct_tech_overview(technology)
    @overall_sum = technology.reviews.reduce(0) do |sum, review|
      sum + review.overall_rating
    end
    @development_sum = technology.reviews.reduce(0) do |sum, review|
      sum + review.development_status
    end
    @community_sum = technology.reviews.reduce(0) do |sum, review|
      sum + review.community
    end
    @maturity_sum = technology.reviews.reduce(0) do |sum, review|
      sum + review.maturity
    end

    @reviews_count = technology.reviews.size
    @review_summary = TechnologyRatingSummary.new()
    @review_summary.overall = @overall_sum / @reviews_count
    @review_summary.development = @development_sum / @reviews_count
    @review_summary.community = @community_sum / @reviews_count
    @review_summary.maturity = @maturity_sum / @reviews_count

    @review_summary
  end
end
