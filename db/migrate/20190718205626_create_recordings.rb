class CreateRecordings < ActiveRecord::Migration[5.2]
  def change
    create_table :recordings do |t|
      t.string :title
      t.text :url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
