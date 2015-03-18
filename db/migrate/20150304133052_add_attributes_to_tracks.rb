class AddAttributesToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :track_code, :string
    add_column :tracks, :name, :string
    add_column :tracks, :description, :string
  end
end
