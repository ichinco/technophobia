class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.String :version_used
      t.Integer :overall_rating
      t.Integer :development_status
      t.Integer :community
      t.Integer :maturity
      t.text :what_makes_it_unique
      t.text :what_is_it_good_at
      t.text :what_is_it_bad_at
      t.text :general_comments

      t.timestamps
    end
  end
end
