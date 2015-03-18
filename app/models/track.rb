class Track < ActiveRecord::Base
  has_many :credits
  has_many :students, :through => :credits

  has_many :requirements
  has_many :electives, :through => :requirements

  validates :track_code, presence: true, uniqueness: true
  validates :name, presence: true
  validates :description, presence: true

  # External CSV File Import funtion
  def self.import(file)  
    CSV.foreach(file.path, headers: true) do |row|
      Track.create! row.to_hash
    end
  end
end
