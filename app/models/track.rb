class Track < ActiveRecord::Base
  has_many :credits
  has_many :students, :through => :credits
end
