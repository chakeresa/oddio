class CreateFlags < ActiveRecord::Migration[5.2]
  def change
    create_table :flags do |t|
      t.references :user, foreign_key: true
      t.references :recording, foreign_key: true
    end
    add_index :flags, [:user_id, :recording_id], unique: true
  end
end
