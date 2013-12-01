class CreateTechnologyPropertyValues < ActiveRecord::Migration
  def change
    create_table :technology_property_values do |t|
      t.references :technology_property, index:true
      t.text :value
      t.references :technology, index:true

      t.timestamps
    end
  end
end
