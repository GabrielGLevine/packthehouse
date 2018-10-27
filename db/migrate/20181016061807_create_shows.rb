# frozen_string_literal: true

class CreateShows < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.string :name
      t.datetime :time
      t.string :location
      t.integer :tickets
      t.integer :price
      t.integer :industry_price
      t.string :link
      t.belongs_to :theater

      t.timestamps
    end
  end
end
