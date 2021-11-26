class ChangeCategoryOfArticles < ActiveRecord::Migration[5.2]
  #デフォルト値を設定すると失敗する
  def up
    change_column :articles, :category, 'integer USING CAST(category AS integer)', null: false#, default: "心"
  end
  def down
    change_column :articles, :category, :string, null: false
  end

end