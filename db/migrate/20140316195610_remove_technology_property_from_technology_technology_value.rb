class RemoveTechnologyPropertyFromTechnologyTechnologyValue < ActiveRecord::Migration
  def change
    remove_reference :technology_technology_values, :technology_property, index: true
  end
end
