class Transcript < ActiveRecord::Base
  belongs_to :student
  belongs_to :elective 

  # :class_name => 'Elective', :foreign_key => "elective_id"
end
