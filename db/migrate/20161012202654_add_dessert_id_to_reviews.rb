class AddDessertIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :dessert_id, :integer, null: false
  end
end
