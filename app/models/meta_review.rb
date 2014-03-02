class MetaReview < ActiveRecord::Base
  belongs_to :user
  belongs_to :text_review
end
