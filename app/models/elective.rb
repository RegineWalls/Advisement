class Elective < ActiveRecord::Base
  require 'csv'
  self.primary_key = 'elective_code'
  
  has_many :transcripts
  has_many :students, :through => :transcripts

  has_many :requirements
  has_many :tracks, :through => :requirements

  validates :name, presence: true, uniqueness: true
  validates :elective_code, presence: true, uniqueness: true
  validates :prerequisites, presence: true
  validates :units, presence: true, numericality: true
  validates :slots, presence: true, numericality: true
  validates :semester, presence: true, numericality: true

  # External CSV File Import funtion
  def self.import(file)  
    CSV.foreach(file.path, headers: true) do |row|
      Elective.create! row.to_hash
    end
  end
end
