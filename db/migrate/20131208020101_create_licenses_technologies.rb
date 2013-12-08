class CreateLicensesTechnologies < ActiveRecord::Migration
  def self.up
    create_table :licenses_technologies, :id => false do |t|
        t.references :license
        t.references :technology
    end
    add_index :licenses_technologies, [:technology_id, :license_id]
    add_index :licenses_technologies, :technology_id
  end

  def self.down
    drop_table :licenses_technologies
  end
end
