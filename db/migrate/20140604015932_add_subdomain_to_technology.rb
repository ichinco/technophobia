class AddSubdomainToTechnology < ActiveRecord::Migration
  def change
    add_reference :technology_types, :subdomain, references: :technology_technology_property, index: true
  end
end
