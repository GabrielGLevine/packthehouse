class CreateShows < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.string :name
      t.datetime :time
      t.string :location
      t.integer :tickets
      t.integer :price

      t.timestamps
    end
  end
end
