class AddDepthToFolders < ActiveRecord::Migration
  def change
    add_column :folders, :depth, :integer
  end
end
