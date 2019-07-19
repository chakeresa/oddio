class AddLandmarkIdToRecordings < ActiveRecord::Migration[5.2]
  def change
    add_reference :recordings, :landmark, foreign_key: true
  end
end
