class AddAttributesToStudents < ActiveRecord::Migration
  def change
#    add_column :students, :students, :string
    add_column :students, :name, :string
    add_column :students, :year_level, :integer
  end
end
