class NumericReview < ActiveRecord::Base
  belongs_to :user
  belongs_to :technology
  belongs_to :review_type
end
