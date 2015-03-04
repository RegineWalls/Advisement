class AddElectiveCodeToElective < ActiveRecord::Migration
  def change
    add_column :electives, :elective_code, :string
    add_index :electives, :elective_code
  end
end
