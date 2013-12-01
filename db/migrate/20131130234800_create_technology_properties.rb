class CreateTechnologyProperties < ActiveRecord::Migration
  def change
    create_table :technology_properties do |t|
      t.references :technology_type, index:true
      t.string :display_name
      t.string :property_type

      t.timestamps
    end
  end
end
