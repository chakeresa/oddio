class CreateLandmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :landmarks do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :address
      t.string :type
      t.string :website
      t.string :phone
      t.string :photo_url

      t.timestamps
    end
  end
end
