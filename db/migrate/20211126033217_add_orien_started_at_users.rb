class AddOrienStartedAtUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :orien_started_at, :date
    add_column :users, :affilication, :string
    add_column :users, :university, :string
    add_column :users, :entered_university_at, :date
    add_column :users, :favorite_terrain, :string
    add_column :users, :favorite_event, :string
    add_column :users, :something_to_say, :string, limit: 80
    add_column :users, :achievement, :text
  end
end
