class ChangeDataTypeFavoriteTerrainOfUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :favorite_terrain, 'integer USING CAST(favorite_terrain AS integer)'
  end
  def down
    change_column :users, :favorite_terrain, :string
  end
end
