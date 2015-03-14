class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students, :id => false do |t|
      t.integer :id_number, :null => false
      t.timestamps
    end
  execute "ALTER TABLE students ADD PRIMARY KEY (id_number);"
  end
end
