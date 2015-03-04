class Elective < ActiveRecord::Base
  has_many :transcripts
  has_many :students, :through => :transcripts
end
