class AddUserIdToDesserts < ActiveRecord::Migration
  def change
    add_column :desserts, :user_id, :integer, null: false
  end
end
