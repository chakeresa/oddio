class CreateGoogleAuths < ActiveRecord::Migration[5.2]
  def change
    create_table :google_auths do |t|
      t.references :user, foreign_key: true
      t.string :uid
      t.string :token

      t.timestamps
    end
  end
end
