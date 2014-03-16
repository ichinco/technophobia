class TechnologyTechnologyProperty < ActiveRecord::Base
  belongs_to :technology_type
  belongs_to :value_type, :class_name=>"TechnologyType"
end
