class DropLanguages < ActiveRecord::Migration
  def change

    drop_table :languages
    drop_table :licenses_technologies
    drop_table :reviews
    drop_table :technologies_licenses_tables
    drop_table :technology_compatible_with
  end
end
