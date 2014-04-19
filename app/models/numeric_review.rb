class NumericReview < ActiveRecord::Base
  belongs_to :user
  belongs_to :technology
  belongs_to :review_type

  validates :review, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 5, only_integer: true }
end
