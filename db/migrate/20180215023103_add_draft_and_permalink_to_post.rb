class AddDraftAndPermalinkToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :draft, :boolean
    add_column :posts, :permalink, :string
  end
end
