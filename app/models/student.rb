class Student < ActiveRecord::Base
  has_many :transcripts
  has_many :electives, :through => :transcripts

  has_many :credits
  has_many :tracks, :through => :credits

  validates :name, presence: true, uniqueness: true
  validates :id_number, presence: true, uniqueness: true
  validates :course, presence: true
  validates :email_address, presence: true
  validates :contact_number, presence: true
  
end
