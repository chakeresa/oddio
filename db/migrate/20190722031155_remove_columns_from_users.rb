class RemoveColumnsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :username, :string
    remove_column :users, :password_digest, :string
  end
end
