class Review < ActiveRecord::Base
  belongs_to :technology
  belongs_to :user
end
