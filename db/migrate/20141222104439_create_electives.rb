class CreateElectives < ActiveRecord::Migration
  def change
    create_table :electives do |t|
      t.string :elective_code, :null => false
      t.timestamps
    end
   # execute "ALTER TABLE electives ADD PRIMARY KEY (elective_code);"
  end
end
