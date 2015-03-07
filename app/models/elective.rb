class Elective < ActiveRecord::Base
  has_many :transcripts
  has_many :students, :through => :transcripts

  has_many :requirements
  has_many :tracks, :through => :requirements

  validates :name, presence: true, uniqueness: true
  validates :elective_code, presence: true, uniqueness: true
  validates :prerequisites, presence: true
  validates :units, presence: true
  validates :slots, presence: true
  validates :semester, presence: true
end
