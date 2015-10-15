class AddUserToTables < ActiveRecord::Migration
  def change
    add_reference :tables, :user, index: true, foreign_key: true
  end
end
