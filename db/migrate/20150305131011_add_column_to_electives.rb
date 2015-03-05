class AddColumnToElectives < ActiveRecord::Migration
  def change
    add_column :electives, :prequisites, :string
  end
end
