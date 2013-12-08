class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.text :name
      t.text :link

      t.timestamps
    end
  end
end
