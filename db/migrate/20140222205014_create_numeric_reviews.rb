class CreateNumericReviews < ActiveRecord::Migration
  def change
    create_table :numeric_reviews do |t|
      t.references :user, index: true
      t.references :technology, index: true
      t.references :review_type, index: true
      t.integer :review

      t.timestamps
    end
  end
end
