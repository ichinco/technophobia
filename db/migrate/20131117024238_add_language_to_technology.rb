class AddLanguageToTechnology < ActiveRecord::Migration
  def change
    add_reference :technologies, :language, index: true
  end
end
