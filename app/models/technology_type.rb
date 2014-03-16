class TechnologyType < ActiveRecord::Base
  has_many :technologies
  has_many :technology_properties
  has_many :technology_technology_properties
end
