class AddCompatibleAssociation < ActiveRecord::Migration
  def change
    create_table "technology_compatible_with", :force => true, :id => false do |t|
      t.integer "technology_a_id", :null => false
      t.integer "technology_b_id", :null => false
    end


  end
end
