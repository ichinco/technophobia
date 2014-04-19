class MetaReview < ActiveRecord::Base
  belongs_to :user
  belongs_to :text_review

  validates :valiance, inclusion: { in: %w(-1 1) }
end
