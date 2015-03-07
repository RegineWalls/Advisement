class Student < ActiveRecord::Base
  require 'CSV'

  has_many :transcripts
  has_many :electives, :through => :transcripts

  has_many :credits
  has_many :tracks, :through => :credits

  validates :name, presence: true, uniqueness: true
  validates :id_number, presence: true, uniqueness: true
  validates :course, presence: true
  validates :email_address, presence: true
  validates :contact_number, presence: true

# External CSV File Import funtion
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
    student_hash = row.to_hash
    student = Student.where(id: student_hash["id"])

    if student.count == 1
       student.first.update_attributes(student_hash) # Attempt to update attributes if preexisting entry
      else
       student.create!(student_hash)
      end
    end
  end
  
end
