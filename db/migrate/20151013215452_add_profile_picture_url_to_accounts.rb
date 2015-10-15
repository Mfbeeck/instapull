class AddProfilePictureUrlToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :profile_picture_url, :string
  end
end
