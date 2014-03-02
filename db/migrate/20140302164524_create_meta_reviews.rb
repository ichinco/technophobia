class CreateMetaReviews < ActiveRecord::Migration
  def change
    create_table :meta_reviews do |t|
      t.references :user, index: true
      t.references :text_review, index: true
      t.integer :valiance

      t.timestamps
    end
  end
end
