class AddMd5HashToLandmarks < ActiveRecord::Migration[5.2]
  def change
    add_column :landmarks, :md5_hash, :string
  end
end
