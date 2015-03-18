class ModifyAttributeInRequirements < ActiveRecord::Migration
  def change
    execute "ALTER TABLE requirements MODIFY semester char(1);"
  end
end
