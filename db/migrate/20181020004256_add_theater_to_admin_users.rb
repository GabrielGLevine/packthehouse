class AddTheaterToAdminUsers < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :admin_users, :theaters
    add_foreign_key :theaters, :admin_users
  end
end
