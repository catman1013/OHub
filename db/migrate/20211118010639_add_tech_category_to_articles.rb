class AddTechCategoryToArticles < ActiveRecord::Migration[5.2]
  def change
    addcolumn :articles, :category, :string
    add_column :articles, :tech_category, :string
  end
end
