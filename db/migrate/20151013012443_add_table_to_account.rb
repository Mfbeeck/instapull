class AddTableToAccount < ActiveRecord::Migration
  def change
    add_reference :accounts, :table, index: true, foreign_key: true
  end
end
