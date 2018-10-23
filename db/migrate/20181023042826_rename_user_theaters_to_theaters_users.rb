class RenameUserTheatersToTheatersUsers < ActiveRecord::Migration[5.2]
  def change
    rename_table :user_theaters, :theaters_users
  end
end
