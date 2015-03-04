class CreateTranscripts < ActiveRecord::Migration
  def change
    create_table :transcripts do |t|
      t.boolean :status
      t.timestamps null: false
      t.belongs_to :student, index: true
      t.belongs_to :elective, index: true
    end
  end
end
