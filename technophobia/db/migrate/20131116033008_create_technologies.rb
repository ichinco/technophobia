class CreateTechnologies < ActiveRecord::Migration
  def change
    create_table :technologies do |t|
      t.references :technology_type, index: true
      t.string :name
      t.text :website

      t.timestamps
    end
  end
end
