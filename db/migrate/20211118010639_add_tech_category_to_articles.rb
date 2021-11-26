class AddTechCategoryToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :tech_category, :string
  end
end
