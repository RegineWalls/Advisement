class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.integer :completed
      t.integer :total

      t.timestamps
      t.belongs_to :student, index: true
      t.belongs_to :track, index: true
    end
  end
end
