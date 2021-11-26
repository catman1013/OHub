class AddUserIdToTasks < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM articles;'
    add_reference :articles, :user, null: false, foreign_key: true, index: true
  end

  def down
    remove_reference :articles, :user, foreign_key: true, index: true
  end
end
