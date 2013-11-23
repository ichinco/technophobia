class CreateTechnologyTypes < ActiveRecord::Migration
  def change
    create_table :technology_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
