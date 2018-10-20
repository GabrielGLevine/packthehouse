class CreateUserTheaters < ActiveRecord::Migration[5.2]
  def change
    create_table :user_theaters, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :theater, index: true
    end
  end
end
