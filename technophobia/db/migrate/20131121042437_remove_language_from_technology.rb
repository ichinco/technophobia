class RemoveLanguageFromTechnology < ActiveRecord::Migration
  def change
    remove_column :technologies, :language_id, :integer
  end
end
