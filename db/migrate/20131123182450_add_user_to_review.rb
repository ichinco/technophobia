class AddUserToReview < ActiveRecord::Migration
  def change
    add_reference :reviews, :user, index:true
  end
end
