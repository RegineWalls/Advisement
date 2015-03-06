class Student < ActiveRecord::Base
  has_many :transcripts
  has_many :electives, :through => :transcripts

  has_many :credits
  has_many :tracks, :through => :credits

  validates :name, presence: true, uniqueness: true
  validates :id_number, presence: true, :numericality => {:greater_than_or_equal_to => 100000, :message => "Invalid ID Number"}
  validates :course, presence: true
  validates :email_address, presence: true
  
  # accepts_nested_attributes_for :student
end
