class Technology < ActiveRecord::Base

  belongs_to :technology_type
  #has_one :built_with, class_name: "Technology"

  has_many :text_reviews
  has_many :numeric_reviews
  has_many :technology_property_values, :dependent => :destroy
  has_many :technology_technology_values, :dependent => :destroy

  has_and_belongs_to_many :licenses

  accepts_nested_attributes_for :technology_property_values
  accepts_nested_attributes_for :technology_technology_values
end
