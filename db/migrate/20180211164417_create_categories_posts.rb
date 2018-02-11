class CreateCategoriesPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_posts , :id=>false, :force=>true do |t|
    	t.integer "post_id" , :null=>false
    	t.integer "category_id" , :null=>false
    end
  end
end
