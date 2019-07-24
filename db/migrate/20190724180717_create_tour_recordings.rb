class CreateTourRecordings < ActiveRecord::Migration[5.2]
  def change
    create_table :tour_recordings do |t|
      t.references :tour, foreign_key: true
      t.references :recording, foreign_key: true

      t.timestamps
    end
  end
end
