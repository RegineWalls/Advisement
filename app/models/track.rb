class Track < ActiveRecord::Base
  has_many :credits
  has_many :students, :through => :credits

  has_many :requirements
  has_many :electives, :through => :requirements
end
