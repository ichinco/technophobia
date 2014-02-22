class CreateReviewTypes < ActiveRecord::Migration
  def change
    create_table :review_types do |t|
      t.string :review_type
      t.string :display_name
      t.string :min_name
      t.string :max_name

      t.timestamps
    end
  end
end
