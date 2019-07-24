class AddPlaceidWebsitePhotoreferenceToLandmarks < ActiveRecord::Migration[5.2]
  def change
    add_column :landmarks, :place_id, :string
    add_column :landmarks, :website, :string
    add_column :landmarks, :photo_reference, :string
  end
end
