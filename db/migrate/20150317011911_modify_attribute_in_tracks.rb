class ModifyAttributeInTracks < ActiveRecord::Migration
  def change
    execute "ALTER TABLE tracks MODIFY track_code varchar(30);"
    execute "ALTER TABLE tracks MODIFY name varchar(25);"
    execute "ALTER TABLE tracks MODIFY description varchar(140);"
  end
end
