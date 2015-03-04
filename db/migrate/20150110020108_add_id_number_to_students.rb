class AddIdNumberToStudents < ActiveRecord::Migration
  def change
    add_column :students, :id_number, :integer
    add_index :students, :id_number
  end
end
