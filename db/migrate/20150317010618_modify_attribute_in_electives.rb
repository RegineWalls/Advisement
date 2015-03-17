class ModifyAttributeInElectives < ActiveRecord::Migration
  def change
    execute "ALTER TABLE electives MODIFY elective_code varchar(10);"
    execute "ALTER TABLE electives MODIFY name varchar(150);"
    execute "ALTER TABLE electives MODIFY units char(1);"
    execute "ALTER TABLE electives MODIFY description varchar(140);"
    execute "ALTER TABLE electives MODIFY semester char(1);"
    execute "ALTER TABLE electives MODIFY slots int(2);"
    execute "ALTER TABLE electives MODIFY prerequisites varchar(40);"
  end
end
