class Requirement < ActiveRecord::Base
  belongs_to :elective
  belongs_to :track
end
