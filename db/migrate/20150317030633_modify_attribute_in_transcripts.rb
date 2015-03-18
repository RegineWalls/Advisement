class ModifyAttributeInTranscripts < ActiveRecord::Migration
  def change
    execute "ALTER TABLE transcripts ALTER COLUMN status SET DEFAULT '0';"
    execute "ALTER TABLE transcripts MODIFY student_id int(6);"
  end
end
