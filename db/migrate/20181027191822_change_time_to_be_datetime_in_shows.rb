class ChangeTimeToBeDatetimeInShows < ActiveRecord::Migration[5.2]
  def change
    change_column :shows, :time, 'timestamptz USING CAST(time AS timestamptz)'
  end
end
