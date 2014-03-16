class AddTechnologyPropertyToTechnologyTechnologyPropertyValue < ActiveRecord::Migration
  def change
    add_reference :technology_technology_values, :technology_technology_property, index: false
  end
end
