class CreateStamps < ActiveRecord::Migration[5.2]
  def change
    create_table :stamps do |t|
      t.integer :type, null: false

      t.references :user, foreign_key: true
      t.references :article, foreign_key: true

      t.timestamp :created_at, null: false
    end
  end
end
