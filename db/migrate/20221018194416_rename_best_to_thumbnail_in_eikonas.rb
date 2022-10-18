class RenameBestToThumbnailInEikonas < ActiveRecord::Migration[7.0]
  def change
    rename_column :eikonas, :best, :thumbnail
  end
end
