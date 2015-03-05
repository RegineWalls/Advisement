class AddColumnToElectives < ActiveRecord::Migration
  def change
    add_column :electives, :prerequisites, :string
  end
end
