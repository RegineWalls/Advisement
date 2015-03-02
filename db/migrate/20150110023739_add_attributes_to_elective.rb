class AddAttributesToElective < ActiveRecord::Migration
  def change
#    change_column :electives, :code, :string
    add_column :electives, :name, :string
    add_column :electives, :units, :integer
    add_column :electives, :description, :string
    add_column :electives, :semester, :integer
    add_column :electives, :slots, :integer 
  end
end
