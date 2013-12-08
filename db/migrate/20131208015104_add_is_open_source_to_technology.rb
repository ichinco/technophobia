class AddIsOpenSourceToTechnology < ActiveRecord::Migration
  def change
    add_column :technologies, :is_open_source, :boolean
  end
end
