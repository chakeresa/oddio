class CreateRecordings < ActiveRecord::Migration[5.2]
  def change
    create_table :recordings do |t|
      t.string :title
      t.string :url
      t.references :user, foreign_key: true
      t.references :landmark, foreign_key: true

      t.timestamps
    end
  end
end
