class FixElectives < ActiveRecord::Migration
  def change
    change_column :electives, :code, :string
  end
end
