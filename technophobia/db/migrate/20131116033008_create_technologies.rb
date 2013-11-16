class CreateTechnologies < ActiveRecord::Migration
  def change
    create_table :technologies do |t|
      t.references :type, index: true
      t.String :name
      t.text :website

      t.timestamps
    end
  end
end
