class AddIdNumberToStudents < ActiveRecord::Migration
  def change
    add_column :students, :id_number, :integer
  end
end
