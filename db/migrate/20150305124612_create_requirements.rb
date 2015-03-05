class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.integer :semester
      t.boolean :is_required

      t.timestamps
      t.belongs_to :elective, index: true
      t.belongs_to :track, index: true
    end
  end
end
