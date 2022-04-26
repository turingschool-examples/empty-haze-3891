class Team < ApplicationRecord
  has_many :players
  has_many :team_comps
  has_many :competitions, through: :team_comps

  validates_presence_of :hometown
  validates_presence_of :nickname

  def average_age
     players.average("age").to_i
   end

   def self.age_ordered
     order("average_age DESC")
   end
 end
