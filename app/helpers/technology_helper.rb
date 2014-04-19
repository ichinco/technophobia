module TechnologyHelper
  def construct_tech_overview(technology)
    @overall_ratings = technology.numeric_reviews.find_all{|r| r.review_type.id==1}
    @overall_sum = @overall_ratings.reduce(0) do |sum, review|
      sum + review.review
    end
    @development_ratings = technology.numeric_reviews.find_all{|r| r.review_type.id==2}
    @development_sum = @development_ratings.reduce(0) do |sum, review|
      sum + review.review
    end
    @community_ratings = technology.numeric_reviews.find_all{|r| r.review_type.id==3}
    @community_sum = @community_ratings.reduce(0) do |sum, review|
      sum + review.review
    end
    @maturity_ratings = technology.numeric_reviews.find_all{|r| r.review_type.id==4}
    @maturity_sum = @maturity_ratings.reduce(0) do |sum, review|
      sum + review.review
    end

    @review_summary = TechnologyRatingSummary.new()
    @review_summary.overall = @overall_ratings.size > 0 ? @overall_sum / @overall_ratings.size : 0
    @review_summary.overall_count = @overall_ratings.size
    @review_summary.development = @development_ratings.size > 0 ? @development_sum / @development_ratings.size : 0
    @review_summary.development_count = @development_ratings.size
    @review_summary.community = @community_ratings.size > 0 ? @community_sum / @community_ratings.size : 0
    @review_summary.community_count = @community_ratings.size
    @review_summary.maturity = @maturity_ratings.size > 0 ? @maturity_sum / @maturity_ratings.size : 0
    @review_summary.maturity_count = @maturity_ratings.size

    @review_summary
  end
end
