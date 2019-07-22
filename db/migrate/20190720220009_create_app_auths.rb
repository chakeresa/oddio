class CreateAppAuths < ActiveRecord::Migration[5.2]
  def change
    create_table :app_auths do |t|
      t.references :user, foreign_key: true
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
