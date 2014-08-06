class CreateStackExchangeTags < ActiveRecord::Migration
  def change
    create_table :stack_exchange_tags do |t|
      t.references :technology, index: true
      t.string :tag

      t.timestamps
    end
  end
end
