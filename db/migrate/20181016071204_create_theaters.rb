# frozen_string_literal: true

class CreateTheaters < ActiveRecord::Migration[5.2]
  def change
    create_table :theaters do |t|
      t.string :name
      t.string :contact

      t.timestamps
    end
  end
end
