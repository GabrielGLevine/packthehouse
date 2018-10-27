class AddColumnTimeToShows < ActiveRecord::Migration[5.2]
  def change
    add_column :shows, :time, :timestamptz
  end
end
