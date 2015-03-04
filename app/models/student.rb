class Student < ActiveRecord::Base
  has_many :transcripts
  has_many :electives, :through => :transcripts
end
