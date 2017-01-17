class AddVoteToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :vote, :integer, default: 0
  end
end
