class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :instagram_id
      t.string :username
      t.string :name
      t.integer :followers
      t.integer :following
      t.integer :posts
      t.string :instagram_url

      t.timestamps null: false
    end
  end
end
