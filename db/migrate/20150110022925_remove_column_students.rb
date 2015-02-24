class RemoveColumnStudents < ActiveRecord::Migration
  def change
    remove_column :students, :students, :string
  end
end
