class ChangeDataTypeFavoriteEventOfUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :favorite_event, 'integer USING CAST(favorite_event AS integer)'
  end
  def down
    change_column :users, :favorite_event, :string
  end
end
