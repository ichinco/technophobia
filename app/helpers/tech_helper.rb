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
    @review_summary.overall = @reviews_count > 0 ? @overall_sum / @reviews_count : 0
    @review_summary.development = @reviews_count > 0 ? @development_sum / @reviews_count : 0
    @review_summary.community = @reviews_count > 0 ? @community_sum / @reviews_count : 0
    @review_summary.maturity = @reviews_count > 0 ? @maturity_sum / @reviews_count : 0

    @review_summary
  end
end
