class AddVoteTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :vote_token, :string
  end
end
