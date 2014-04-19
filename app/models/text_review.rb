class TextReview < ActiveRecord::Base
  belongs_to :user
  belongs_to :technology
  belongs_to :review_type

  validates :review, :length => {in: 10 .. 1000}
end
