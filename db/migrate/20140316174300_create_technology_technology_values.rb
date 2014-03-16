class CreateTechnologyTechnologyValues < ActiveRecord::Migration
  def change
    create_table :technology_technology_values do |t|
      t.references :technology_property, index: true
      t.references :technology, index: true
      t.references :value, index: true

      t.timestamps
    end
  end
end
