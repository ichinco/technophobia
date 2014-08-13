class Technology < ActiveRecord::Base

  belongs_to :technology_type

  has_many :text_reviews
  has_many :numeric_reviews
  has_many :technology_property_values, :dependent => :destroy
  has_many :technology_technology_values, :dependent => :destroy
  has_many :stack_exchange_tags, :dependent => :destroy

  validates :name, :presence => true
  validates :name, length: {in: 1 .. 50}

  accepts_nested_attributes_for :technology_property_values
  accepts_nested_attributes_for :technology_technology_values
end
