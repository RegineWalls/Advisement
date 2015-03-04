class AddAttributesToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :track_code, :string
    add_column :tracks, :type, :string
    add_index :tracks, :track_code
  end
end