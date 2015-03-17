class ModifyAttributeInCredits < ActiveRecord::Migration
  def change
    execute "ALTER TABLE credits MODIFY completed int(2);"
    execute "ALTER TABLE credits MODIFY total int(2);"
    execute "ALTER TABLE credits MODIFY student_id int(6);"
  end
end
