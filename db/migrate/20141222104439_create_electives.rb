class CreateElectives < ActiveRecord::Migration
  def change
    create_table :electives do |t|

      t.timestamps
    end
  end
end
