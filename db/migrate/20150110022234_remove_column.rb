class RemoveColumn < ActiveRecord::Migration
  def change
     remove_column :students, :students
  end
end
