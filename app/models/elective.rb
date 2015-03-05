class Elective < ActiveRecord::Base
  has_many :transcripts
  has_many :students, :through => :transcripts

  has_many :requirements
  has_many :tracks, :through => :requirements
end
