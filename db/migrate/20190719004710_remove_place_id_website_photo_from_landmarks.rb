class RemovePlaceIdWebsitePhotoFromLandmarks < ActiveRecord::Migration[5.2]
  def change
    remove_column :landmarks, :place_id, :string
    remove_column :landmarks, :website, :string
    remove_column :landmarks, :photo, :string
  end
end
