class CreateTextReviews < ActiveRecord::Migration
  def change
    create_table :text_reviews do |t|
      t.references :user, index: true
      t.references :technology, index: true
      t.references :review_type, index:true
      t.text :review

      t.timestamps
    end
  end
end
