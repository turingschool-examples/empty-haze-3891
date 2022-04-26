class Competition < ApplicationRecord
  has_many :team_comps
  has_many :teams, through: :team_comps

  validates_presence_of :name
  validates_presence_of :location
  validates_presence_of :sport

  def average_age
     players.average("age").to_i
   end



end
