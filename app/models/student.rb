class Student < ActiveRecord::Base
  has_many :transcripts
  has_many :electives, :through => :transcripts

  has_many :credits
  has_many :tracks, :through => :credits
end
