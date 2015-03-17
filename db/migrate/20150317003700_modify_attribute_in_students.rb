class ModifyAttributeInStudents < ActiveRecord::Migration
  def change
    execute "ALTER TABLE students MODIFY year_level int(1);"
    execute "ALTER TABLE students MODIFY course varchar(20);"
    execute "ALTER TABLE students MODIFY track varchar(25);"
    execute "ALTER TABLE students MODIFY specialization varchar(25);"
    execute "ALTER TABLE students MODIFY email_address varchar(30);"
    execute "ALTER TABLE students MODIFY contact_number varchar(11);"
  end
end
