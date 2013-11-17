class Technology < ActiveRecord::Base
  has_one :technology_type
  has_one :language

  has_many :reviews

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
end
