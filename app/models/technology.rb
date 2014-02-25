class Technology < ActiveRecord::Base

  belongs_to :technology_type
  #has_one :built_with, class_name: "Technology"

  has_many :text_reviews
  has_many :numeric_reviews
  has_many :technology_property_values, :dependent => :destroy

  has_and_belongs_to_many(:compatible_with,
    :class_name => "Technology",
    :join_table => "technology_compatible_with",
    :foreign_key => "technology_a_id",
    :association_foreign_key => "technology_b_id")

  has_and_belongs_to_many(:in_ecosystem,
    :class_name => "Technology",
    :join_table => "technology_compatible_with",
    :foreign_key => "technology_b_id",
    :association_foreign_key => "technology_a_id")

  has_and_belongs_to_many :licenses

  accepts_nested_attributes_for :technology_property_values
end
