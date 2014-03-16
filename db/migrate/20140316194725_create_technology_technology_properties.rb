class CreateTechnologyTechnologyProperties < ActiveRecord::Migration
  def change
    create_table :technology_technology_properties do |t|
      t.references :technology_type, index: true
      t.string :display_name
      t.references :value_type, index: true

      t.timestamps
    end
  end
end
