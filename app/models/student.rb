class Student < ActiveRecord::Base
  require 'csv'
  self.primary_key = 'id_number'

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
#    attr_accessible :name, :course, :email_address, :contact_number
def self.import(file)  
  CSV.foreach(file.path, headers: true) do |row|
    Student.create! row.to_hash
#    student = find_by_id(row["id"]) || new  
#    student.attributes = row.to_hash.slice(*accessible_attributes)  
#    student.save! 
  end
end
# End of External CSV File Import Function
end
