class Student < ActiveRecord::Base
  require 'csv'
  self.primary_key = 'id_number'

  has_many :transcripts
  has_many :electives, :through => :transcripts

  has_many :credits
  has_many :tracks, :through => :credits

  validates :name, presence: true, uniqueness: true
  validates :id_number, presence: true, uniqueness: true, length: { minimum: 6, maximum: 6 }, numericality: true
  validates :year_level, presence: true
  validates :course, presence: true
  validates :email_address, presence: true
  validates :contact_number, presence: true, length: { minimum: 11, maximum: 13 }, numericality: true
  
  accepts_nested_attributes_for :transcripts
  
 def self.search(search)
  if search
    find(:all, :conditions => ['id_number LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end

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
