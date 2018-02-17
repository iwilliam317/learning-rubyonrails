class RenamePermalinkToSlug < ActiveRecord::Migration[5.1]
  def change
  	rename_column :posts, :permalink, :slug    
  end
end
