class TechnologyTechnologyValue < ActiveRecord::Base
  belongs_to :technology_technology_property
  belongs_to :technology
  belongs_to :value, :class_name => "Technology"
end
