class CreateDesserts < ActiveRecord::Migration
  def change
    create_table :desserts do |t|
        t.string :name, null: false
        t.string :description, null: false
    end
  end
end
