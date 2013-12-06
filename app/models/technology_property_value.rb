class TechnologyPropertyValue < ActiveRecord::Base
  belongs_to :technology_property
  belongs_to :technology
end
