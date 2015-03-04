class Credit < ActiveRecord::Base
  belongs_to :student
  belongs_to :track
end
