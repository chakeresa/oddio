class CreateLandmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :landmarks do |t|
      t.string :place_id
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :long, precision: 10, scale: 6
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :category
      t.string :website
      t.string :photo

      t.timestamps
    end
  end
end
