class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :technology, index: true
      t.string :version_used
      t.integer :overall_rating
      t.integer :development_status
      t.integer :community
      t.integer :maturity
      t.text :what_makes_it_unique
      t.text :what_is_it_good_at
      t.text :what_is_it_bad_at
      t.text :general_comments

      t.timestamps
    end
  end
end
